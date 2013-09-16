#!/usr/local/ruby/bin/ruby
i=0
loop{
  print "Ruby!"
  i+=1
  if i>=10
    print "\n"
    break
  end
}
print "===========================================\n"
print "break Sample:\n"
i=0
["Perl","Python","Ruby","Scheme"].each{|lang|
  i+=1
  if i==3
    break
  end
  p [i,lang]
}
print "===========================================\n"
print "next Sample:\n"
i=0
["Perl","Python","Ruby","Scheme"].each{|lang|
  i+=1
  if i==3
    next
  end
  p [i,lang]
}
print "===========================================\n"
print "redo Sample:\n"
i=0
["Perl","Python","Ruby","Scheme"].each{|lang|
  i+=1
  if i==3
    redo
  end
  p [i,lang]
}
