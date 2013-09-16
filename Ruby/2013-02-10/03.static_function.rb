#!/usr/local/ruby/bin/ruby
class HelloWorld
  def initialize(myname="Ruby")
    @name=myname
  end
  def hello
    print "Hello, world. I am ",@name,".\n"
  end
  def HelloWorld.static_one(name)
    print name," said Hello 1.\n"
  end
  def self.static_three(name)
    print name," said Hello 3.\n"
  end
end

class << HelloWorld
  def static_two(name)
    print name," said Hello 2.\n"
  end
end

bob=HelloWorld.new("Bob")
alice=HelloWorld.new("Alice")
ruby=HelloWorld.new

bob.hello
alice.hello
ruby.hello
print "==========================================\n"
HelloWorld.static_one "ChengXiang"
HelloWorld.static_two "Mike"
HelloWorld.static_three "Tom"
