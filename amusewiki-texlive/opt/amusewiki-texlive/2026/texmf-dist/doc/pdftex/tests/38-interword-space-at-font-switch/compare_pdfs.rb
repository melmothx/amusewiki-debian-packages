#!/usr/bin/env ruby

require 'tmpdir'
require 'fileutils'

def parse_options(args)
  options = { resolution: 150, threshold: 100, fuzz: 5 }

  args.each do |arg|
    case arg
    when /^--res=(\d+)$/
      options[:resolution] = $1.to_i
    when /^--threshold=(\d+)$/
      options[:threshold] = $1.to_i
    when /^--fuzz=(\d+)$/
      options[:fuzz] = $1.to_i
    end
  end

  options
end

def usage
  puts "Usage: #{$0} <pdf1> <pdf2> [options]"
  puts "Compares two PDF files by converting to PNG and analyzing differences"
  puts "\nOptions:"
  puts "  --res=N        DPI value for conversion (default: 150)"
  puts "  --threshold=N  Difference threshold in pixels (default: 100)"
  puts "  --fuzz=N       Fuzz factor percentage (default: 5)"
  exit 1
end

def convert_pdf_to_png(pdf_path, output_prefix, resolution=150)
  system("magick -density #{resolution} \"#{pdf_path}\" \"#{output_prefix}-%d.png\"")
  unless $?.success?
    puts "Error converting #{pdf_path} to PNG"
    exit 1
  end
  # Return the number of pages (count PNG files created)
  Dir["#{output_prefix}-*.png"].length
end

def create_diff_visualization(image1, image2, diff_output_base)
  system("magick '(' \"#{image1}\" -flatten -grayscale Rec709Luminance ')' " \
         "'(' \"#{image2}\" -flatten -grayscale Rec709Luminance ')' " \
         "'(' -clone 0-1 -compose darken -composite ')' " \
         "-channel RGB -combine \"#{diff_output_base}\"")
end

def compare_images(image1, image2, diff_output_base, fuzz=5)
  # First create both types of difference visualizations
  base_name = File.join(File.dirname(diff_output_base),
                        File.basename(diff_output_base))

  compare_output = "#{base_name}-compare.png"
  visual_output = "#{base_name}-visual.png"

  # Generate standard comparison diff
  result = `magick compare -fuzz #{fuzz}% -metric AE "#{image1}" "#{image2}" "#{compare_output}" 2>&1`

  # Generate alternative visualization
  create_diff_visualization(image1, image2, visual_output)

  difference = result.to_i
  return difference
rescue
  return -1  # Return -1 if comparison fails (e.g., different image sizes)
end

def compare_all_pages(dir1, dir2, diff_dir, threshold=100, fuzz=5)
  differences = {}
  total_differences = 0

  # Get all pages from first PDF
  Dir["#{dir1}/*.png"].sort.each_with_index do |page1, idx|
    page_num = idx + 1
    page2 = File.join(dir2, File.basename(page1))

    if File.exist?(page2)
      diff_output_base = File.join(diff_dir, "diff-page-#{page_num}-")
      diff = compare_images(page1, page2, diff_output_base)

      if diff == -1
        puts "Page #{page_num}: Error comparing pages (possibly different dimensions)"
        differences[page_num] = "error"
      elsif diff <= threshold
        if diff == 0
          puts "Page #{page_num}: Identical"
        else
          puts "Page #{page_num}: Minor differences (#{diff} pixels) - below threshold"
        end
        Dir["#{diff_output_base}*"].each { |file| File.delete(file) if File.exist?(file) }
        differences[page_num] = 0
      else
        base_name = File.join(File.dirname(diff_output_base),
                              File.basename(diff_output_base))
        puts "Page #{page_num}: Significant differences (#{diff} pixels)"
        puts "Difference images saved as:"
        puts "  - Compare method: #{base_name}-compare.png"
        puts "  - Visual method:  #{base_name}-visual.png"
        differences[page_num] = diff
        total_differences += diff
      end
    else
      puts "Page #{page_num}: Missing in second PDF"
      differences[page_num] = "missing"
    end
  end

  # Check for extra pages in second PDF
  Dir["#{dir2}/*.png"].each do |page2|
    base_name = File.basename(page2)
    unless File.exist?(File.join(dir1, base_name))
      puts "Extra page in second PDF: #{base_name}"
      differences[base_name] = "extra"
    end
  end

  [differences, total_differences]
end

# Main execution
usage if ARGV.length < 2

pdf1_path = ARGV.shift
pdf2_path = ARGV.shift
options = parse_options(ARGV)

unless File.exist?(pdf1_path) && File.exist?(pdf2_path)
  puts "Error: One or both PDF files do not exist"
  exit 1
end

Dir.mktmpdir do |tmp_dir|
  # Create subdirectories for each PDF's pages
  pdf1_dir = File.join(tmp_dir, "pdf1")
  pdf2_dir = File.join(tmp_dir, "pdf2")
  diff_dir = "diff_output"

  FileUtils.rm_rf(diff_dir)
  FileUtils.mkdir_p([pdf1_dir, pdf2_dir, diff_dir])

  puts "Converting PDFs to PNGs (#{options[:resolution]} DPI)..."
  pages1 = convert_pdf_to_png(pdf1_path, File.join(pdf1_dir, "page"), options[:resolution])
  pages2 = convert_pdf_to_png(pdf2_path, File.join(pdf2_dir, "page"), options[:resolution])

  puts "\nPDF 1 has #{pages1} pages"
  puts "PDF 2 has #{pages2} pages"

  puts "\nComparing pages..."
  differences, total_diff = compare_all_pages(pdf1_dir, pdf2_dir, diff_dir,
                                            options[:threshold], options[:fuzz])

  puts "\nSummary:"
  if differences.all? { |_, v| v == 0 }
    puts "The PDFs are identical"
    FileUtils.rm_rf(diff_dir)
  else
    puts "The PDFs are different"
    puts "Total pixels different across all pages: #{total_diff}"
    puts "Difference images saved in: #{diff_dir}/"
  end
end
