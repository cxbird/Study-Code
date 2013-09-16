#!/usr/local/ruby/bin/ruby
filename=ARGV[0]
file=open(filename)
while text=file.gets
  next if /^\s*$/=~text
  next if /^#/=~text
  print text
end
