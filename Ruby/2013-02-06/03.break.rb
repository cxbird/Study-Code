#!/usr/local/ruby/bin/ruby
pattern=Regexp.new(ARGV[0])
filename=ARGV[1]
max_matches=10 #最大输出行数
matches=0
file=open(filename)
while text=file.gets
  if matches>=max_matches
    break
  end
  if pattern=~text
    matches+=1
    print "(",matches,")",text
  end
end
