#!/usr/bin/env ruby
class Greeter
  attr_accessor :age

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

g = Greeter.new("Barney")
g.age = 10
puts g.name
puts g.age
g.name = "Betty"
puts g.name
