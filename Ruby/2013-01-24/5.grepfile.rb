filename=ARGV[0]
if ARGV[0]==nil
    print "No File Name!\n"
else
    pattern=Regexp.new(ARGV[1])
    file=open(filename)
    while text=file.gets
        if pattern=~text
            print text
        end
    end
    print "\n",file.class,"\n"
    file.close
    print file.class,"\n",pattern.class,"\n"
end
