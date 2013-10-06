#!/usr/bin/env ruby
class MyClass
  def m1
    puts "m1 is public."
    m2
    m3
  end

  protected
  def m2
    puts "m2 is protected."
  end

  private
  def m3
    puts "m3 is private"
  end
end

mc = MyClass.new
mc.m1
#mc.m2
mc.m3
