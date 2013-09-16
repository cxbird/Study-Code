ary1=[]
ary2=[]
p ary1.object_id
p ary2.object_id
p "-------------------------------------"
str1 = "foo"
str2 = str1
str3 = "f"+"o"+"o"
print "str1.equal?(str2)="
p str1.equal?(str2)
print "str1.equal?(str3)="
p str1.equal?(str3)
print "str1==str3 :"
p str1 == str3
p "-------------------------------------"
print "1.0 == 1 :"
p 1.0 == 1
print "1.0.eql?1="
p 1.0.eql?1
print "1.0.eql?1.0="
p 1.0.eql?1.0
p "-------------------------------------"
hash={0=>"0"}
p hash[0]
p hash["0"]
p "-------------------------------------"
if 2 >1;p 2>1;end
p "-------------------------------------"
def foo;raise NotImplementedError; end
a=0;b=0
while a<10
    while b<20
        b=b+1
        print b
    end
    a=a+1
    print a
end
print  "\n"
