#!/usr/bin/env ruby
def wrap &b
  print "Santa says:"
  3.times(&b)
  print "\n" 
end
wrap { print "Ho! "}
