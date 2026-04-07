#!/usr/bin/env ruby
# Copyright (C) 2003, NAGY Bence <huhyphn@tipogral.hu>
# This program can be distributed under the terms of the
# GNU General Public License version 2.

$programname='Testhyphenation'
$programversion='v20031102'

class Testhyphenation
  def initialize
    print "Minták betöltése...\n"
    @patterns=[]
    patterns=0
    IO.foreach("huhyphn.tex"){|aline|
      unless aline=~/[\\%{}]/
        aline=aline.gsub('®','õ').gsub('¶','û')
        letter=false
        key,value='',''
        aline.chop.length.times{|i|
          if aline[i,1]=~/\d/
            value<<aline[i,1]
            letter=false
          else
            value<<'0' if letter
            key<<aline[i,1]
            letter=true
          end
        }
        value<<'0' if letter
        @patterns[key.length]={} unless @patterns[key.length]
        @patterns[key.length][key]=value
        patterns+=1
      else
        puts $1 if aline=~/\\message\{(.*)\}/
      end
    } if File.exist?("huhyphn.tex")
    @patterns.length.times{|i|
      @patterns[i]={} unless @patterns[i]
    }
    print patterns," minta betöltve.\n\n"
  end
  def getpattern(key,value)
    pattern=''
    pattern=value.slice!(0,1) if value.length>key.length
    key.length.times{|i|
      pattern<<key[i]
      pattern<<value[i] if value[i]
    }
    pattern.delete('0')
  end
  def hyphenword(word)
    if word.length>1
      key='.'+word+'.'
      value='0'*key.length
      key.tr!('A-ZÁÄÉÍÓÖÕÚÜÛ','a-záäéíóöõúüû')
      pattern=''
      1.upto(key.length){|i|
        0.upto(key.length-i){|j|
          if @patterns[i] and pattern=@patterns[i][key[j,i]]
            print "\t",getpattern(key[j,i].dup,pattern.dup),"\n"
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
    print "#{word} -> #{hyphenated}\n\n"
    hyphenated
  end
end

print "#{$programname} #{$programversion}\n"
testhyphenation=Testhyphenation.new
while gets
  break if $_=="\n"
  testhyphenation.hyphenword($_.strip)
end
