p /Ruby/=~"Ruby"
p /ruby/=~"Ruby"
p /Ruby/=~"Diamond"
p /Ruby/=~"Yet Another Ruby Hacker,"
p /Yet Another Ruby Hacker,/=~"Ruby"
p /Ruby/=~"RUBY"
print "i ---------------------------------\n"
p /Ruby/i=~"ruby"
p /Ruby/i=~"RuBy"
p /Ruby/i=~"aRUBY"

study=["Ruby Code","i Like Ruby","Ruby on Rails","Linux Administrator"]
study.each {|name|
    if /ruby/i=~name
        puts name
    end
}
