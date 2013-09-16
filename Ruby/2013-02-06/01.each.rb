#!/usr/local/ruby/bin/ruby
names=["awk","Perl","Python","Ruby"]
names.each{|name|
  print name,"\n"
}
print "==========================================\n"
sum=0
(1..5).each{|i|
  sum=sum+i
}
print "sum=",sum,"\n"
