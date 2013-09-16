a=100
b=20
if b>a
  print "b>a\n"
elsif b==a
  print "b=a\n"
else
  print "b<a\n"
end
print "-------------------------------\n"
unless a>b
  print "b>a\n"
else
  print "b<=a\n"
end
print "-------------------------------\n"
tags=["A","IMG","PRE"]
tags.each{|tagname|
  case tagname
  when "P","A","I","B","BLOCKQUOTE"
    print tagname," has child.\n"
  when "IMG","BR"
    print tagname," has no child.\n"
  else
    print tagname," cannot be used.\n" 
  end
}
print "-------------------------------\n"
tags=["aa",1,nil]
tags.each{|item|
  case item
  when String
    print item, " is a String.\n"
  when Numeric
    print item, " is a Numeric.\n"
  else
    print item, " is a something.\n"
  end
}
print "-------------------------------\n"
print "3>2\n" if 3>2
print "3>2\n" unless 2>3
print "-------------------------------\n"
print '((1..3) === 2) = '
p ((1..3)===2)
print '/zz/ === "zyzzy" = '
p /zz/ === "zyzzy"
print 'String === "zyzzy" = '
p String === "zyzzy"
print '"zyzzy" === String = '
p "zyzzy" === String
