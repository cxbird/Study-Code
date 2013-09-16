def chab(s) #contains hex in angle brackets
  puts (s =~ /<0(x|X)(\d|[a-f]|[A-F])+>/) != nil
end

chab "Not this one."
chab "Maybe this?{0x35}" #wrong kind of brackets
chab "Okay, this: <0xfc0005>"
