#!/usr/bin/env ruby
class String
  def palindrome?
    self == self.reverse
  end
end

puts "level".palindrome?
puts "foobar".palindrome?
puts "deified".palindrome?
