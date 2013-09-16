filename=ARGV[0]
if ARGV[0]==nil
    print "No File Name!\n"
else
    file=open(filename)
    while text=file.gets
        print text
    end
    print "\n",file.class,"\n"
    file.close
    print "\n",file.class,"\n"
end
