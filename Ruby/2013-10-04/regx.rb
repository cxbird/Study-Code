#!/usr/bin/env ruby
line = gets
if line =~ /P(erl|ython)/
  puts "There seems to be another scripting language here."
else
  puts "There is No!"
end
