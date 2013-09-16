4.times do
  print "flower~~~\n"
end
print "-------------------------------\n"
4.times {
  print "sun~~~\n"
}
print "-------------------------------\n"
4.times do |i|
  print "It's No.",i,".\n"
end
print "-------------------------------\n"
5.times { |i|
  print "It's No.",i+1,".\n"
}
print "-------------------------------\n"
5.times { |i|
  p i
  print "Change i->times No.",i+1,".\n"
  i=i+2		#强制变换i值步进，对 times 的循环无效。
  p i
}
print "-------------------------------\n"
-5.times { |i|  #负数无法使用 times 方法。
  print "It's No.",i,".\n"
}
print "-------------------------------\n"
v=2		#变量能 times 吗？
v.times { |i|
  print "It's No.",i+1,".\n"
}
print "-------------------------------\n"
