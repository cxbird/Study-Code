#!/usr/local/ruby/bin/ruby
ary=[]
str="Hello world."
print "ary.instance_of?(Array)="
p ary.instance_of?(Array)
print "str.instance_of?(String)="
p str.instance_of?(String)
print "ary.instance_of?(String)="
p ary.instance_of?(String)
print "str.instance_of?(Array)="
p str.instance_of?(Array)
print "str.instance_of?(Object)="
p str.instance_of?(Object)
print "str.is_a?(String)="
p str.is_a?(String)
print "str.is_a?(Object)="
p str.is_a?(Object)
