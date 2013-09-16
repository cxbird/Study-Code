#!/usr/local/ruby/bin/ruby
i=1
while i<3
  print i,"\n"
  i+=1
end
print "-------------------------------\n"
sum=0
i=1
while i<=5
  sum+=i
  i+=1
end
print "sum=",sum,"\n"
print "-------------------------------\n"
sum=0
i=1
while sum<50
  sum+=i
  i+=1
end
print "while -> sum=",sum," i=",i,"\n"
print "-------------------------------\n"
sum=0
i=1
until sum>=50
  sum+=i
  i+=1
end
print "until -> sum=",sum," i=",i,"\n"
print "-------------------------------\n"
sum=0
i=1
while !(sum>=50)
  sum+=i
  i+=1
end
print "while!-> sum=",sum," i=",i,"\n"
print "-------------------------------\n"
