filename=ARGV[0]
if ARGV[0]==nil
    print "No File Name!\n"
else
    file=open(filename)
    text=file.read
    print text
    file.close
end
