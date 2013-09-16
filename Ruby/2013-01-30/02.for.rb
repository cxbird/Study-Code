sum=0
for i in 1..5
  sum+=i
end
print "sum=",sum,"\n"
print "--------------------------------\n"
from=10
to=20
sum=0
(to-from+1).times{|i|
  sum+=(i+from)
}
print "sum=",sum,"\n"
print "--------------------------------\n"
from=10
to=20
sum=0
for i in from..to
  sum+=i
end
print "sum=",sum,"\n"
print "--------------------------------\n"
names=["awk","Perl","Python","Ruby"]
for name in names do
  print name + "\n"
end
print "--------------------------------\n"
