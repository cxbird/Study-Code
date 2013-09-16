#!/usr/local/ruby/bin/ruby
class HelloWorld
  def initialize(myname="Ruby")
    @name=myname
  end
  def hello
    print "Hello, world. I am ",@name,".\n"
  end
  attr_accessor:name
end

bob=HelloWorld.new("Bob")
alice=HelloWorld.new("Alice")
ruby=HelloWorld.new

bob.hello
alice.hello
ruby.hello
print "==========================================\n"
#@name 只能在对象内使用，对象外使用有问题。
p bob.name
p alice.name
p ruby.name
print "==========================================\n"
bob.name="Test-Bob"
alice.name="Test-Alice"
ruby.name="Test-Ruby"
bob.hello
alice.hello
ruby.hello
