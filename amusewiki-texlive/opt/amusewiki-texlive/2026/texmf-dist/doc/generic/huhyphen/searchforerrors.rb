#!/usr/bin/env ruby
# Copyright (C) 2003, NAGY Bence <huhyphn@tipogral.hu>
# This program can be distributed under the terms of the
# GNU General Public License version 2.

$programname='Searchforerrors'
$programversion='v20031102'

class Searchforerrors
  def initialize
    print "Minták betöltése...\n"
    @patterns=[]
    patterns=0
    IO.foreach("huhyphn.tex"){|aline|
      unless aline=~/[\\%{}]/
        aline=aline.gsub('®','õ').gsub('¶','û')
        letter=false
        hyphenated,value='',''
        aline.chop.length.times{|i|
          if aline[i,1]=~/\d/
            value<<aline[i,1]
            letter=false
          else
            value<<'0' if letter
            hyphenated<<aline[i,1]
            letter=true
          end
        }
        value<<'0' if letter
        @patterns[hyphenated.length]={} unless @patterns[hyphenated.length]
        @patterns[hyphenated.length][hyphenated]=value
        patterns+=1
      else
        puts $1 if aline=~/\\message\{(.*)\}/
      end
    } if File.exist?("huhyphn.tex")
    @patterns.length.times{|i|
      @patterns[i]={} unless @patterns[i]
    }
    print patterns," minta betöltve.\n"
  end
  def getpattern(hyphenated,value)
    pattern=''
    pattern=value.slice!(0,1) if value.length>hyphenated.length
    hyphenated.length.times{|i|
      pattern<<hyphenated[i]
      pattern<<value[i] if value[i]
    }
    pattern.delete('0')
  end
  def hyphenword(word)
    if word.length>1
      hyphenated='.'+word+'.'
      value='0'*hyphenated.length
      hyphenated.tr!('A-ZÁÄÉÍÓÖÕÚÜÛ','a-záäéíóöõúüû')
      pattern=''
      1.upto(hyphenated.length){|i|
        0.upto(hyphenated.length-i){|j|
          if @patterns[i] and pattern=@patterns[i][hyphenated[j,i]]
            pattern.length.times{|k|
              value[j+i-pattern.length+k]=pattern[k] if value[j+i-pattern.length+k]<pattern[k]
            }
          end
        }
      }
      hyphenated=''
      0.upto(word.length-2){|i|
        hyphenated<<word[i,1]
        hyphenated<<'-' if value[i+1,1]=~/[13579]/
      }
      hyphenated<<word[-1,1] 
    else
      hyphenated=word
    end
    hyphenated.tr('A-ZÁÄÉÍÓÖÕÚÜÛ','a-záäéíóöõúüû')
  end
end

print "#{$programname} #{$programversion}\n"
filename=ARGV.shift
if filename and File.exist?(filename)
  searchforerrors=Searchforerrors.new
  words=[]
  IO.foreach(filename){|aline|
    aline.strip.split(/[{}.,;:!?\s]+/).each{|aword|
      if aword=~/\A[A-Za-zÁÁÉÍÓÖÕÚÜÛáäéíóöõúüû]+\Z/
        word=searchforerrors.hyphenword(aword)
        if (word=~/-([bcdfghjklmnpqrstvwxyz]|cs|dz|dzs|gy|ly|ny|sz|ty|zs)-/ or
          word=~/[bcdfghjklmnpqrstvwxyz]-[aeiouáäéíóöõúüû]-[bcdfghjklmnpqrstvwxyz]/ or
          word=~/[bcdfghjklmnpqrstvwxyz](ccs|ddz|ddzs|ggy|lly|nny|ssz|tty|zzs)/ or
          word=~/(ccs|ddz|ddzs|ggy|lly|nny|ssz|tty|zzs)[bcdfghjklmnpqrstvwxyz]/ or
          word=~/[aáoóuú](ccs|ddz|ddzs|ggy|lly|nny|ssz|tty|zzs)[eéöõüû]/ or
          word=~/[eéöõüû](ccs|ddz|ddzs|ggy|lly|nny|ssz|tty|zzs)[aáoóuú]/) or
          word=~/(csz|zsz|szs)/ or
          word=~/[bcdfghjklmnpqrstvwxyz]{1,2}[aeiouáäéíóöõúüû]([bcdfghjklmnpqrstvwxyz]{1,2})[aeiouáäéíóöõúüû]/ and
          not words.include?(word)
          print word,"\n"
          words<<word
        end
      end
    }
  }
else
  print 'Nincs fájlnév megadva vagy a fájl nem létezik!',"\n"
end
