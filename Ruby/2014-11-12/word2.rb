#!/usr/bin/env ruby
class Word < String
  def palindrome?
    self == self.reverse
  end
end

w = Word.new("level")
puts w.palindrome?

s = Word.new("foobar")
puts s.palindrome?
puts s.length
puts s.class
puts s.class.superclass
