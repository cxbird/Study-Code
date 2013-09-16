print "First: ",ARGV[0],"\n"
print "Second: ",ARGV[1],"\n"
if ARGV[2]==nil
    print "Three: Nothing....\n"
else
    print "Three: ",ARGV[2],"\n"
end
name = ARGV[3]
print "Happy Birthday, ",name,"!\n"
print "--------------------------------------\n"
ARGV.each{|argv|
    print argv," --> ",argv.class,"\n"
}
