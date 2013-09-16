name=["中国","四川","成都","草堂"]
i=0
while i<4
    p name[i]
    i=i+1
end
while i>0
    i=i-1
    print name[i],"\n"
end
print "p name ===========================>\n"
p name
print "puts name ========================>\n"
puts name
print "print name =======================>\n"
print name,"\n"
name[3]="天府广场"
p name
print "数组大小："
p name.size
print "print add array ------------------>\n"
name[4]="毛主席塑像"
p name
print "print add bigarray --------------->\n"
name[6]="Hi！！"	#name[5]自动设置为 nil 对象
p name
print "数组大小："
p name.size
print "each function -------------------->\n"
name.each{|a|
    puts a
}
print "function InSide/OutSide i -------->\n"
print "OutSide i=",i,"\n"
name.each{|i|
    print "InSide i=",i,"\n" #嵌套函数内外变量隔离了！！，i值不受影响
}
print "OutSide i=",i,"\n"
print "-----------------------------------\n"
p name.class
