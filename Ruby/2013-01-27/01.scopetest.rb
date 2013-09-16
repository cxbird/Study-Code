$x=0
x=0

require "./sub.rb"

print "$x="
p $x
print "x="
p x
print "Constant -----------------------------------------\n"
print "RUBY_VERSION=",RUBY_VERSION,"\n"
print "RUBY_PLATFORM=",RUBY_PLATFORM,"\n"
print "Ver Name -----------------------------------------\n"
start =1
#end=10       #end 是保留字不能定义为变量名
End=10
for i in start .. End
    p i
end
#End = 20      #End 是常量不能再次定义了
print "--------------------------------------------------\n"
