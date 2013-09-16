#!/usr/local/ruby/bin/ruby
class HelloCount
  @@count=0
  def initialize(myname="Ruby")
    @name=myname
  end
  def hello
    @@count+=1
    print "Hello, world. I am ",@name,".\n"
  end
  def HelloCount.count
    @@count
  end
  def getCount
    return @@count
  end
end

bob=HelloCount.new("Bob")
alice=HelloCount.new("Alice")
ruby=HelloCount.new

p HelloCount.count
bob.hello
p bob.getCount
alice.hello
p alice.getCount
ruby.hello
p ruby.getCount
p HelloCount.count
print "==========================================\n"
