#!/usr/bin/env ruby
class Word
  def palindrome?(string)
    string == string.reverse
  end
end

w = Word.new
puts w.palindrome?("foobar")
puts w.palindrome?("level")
