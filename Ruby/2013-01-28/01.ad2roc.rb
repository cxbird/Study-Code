#将公元转换为民国年

if ARGV[0].to_i>=1911
  ad=ARGV[0].to_i
  roc=ad-1911
  print roc,"\n"
else
  print "End by <1911.\n"
  exit
end
print "-----------------------------------------\n"
print '"".empty?'
p "".empty?
print '"AAA".empty?'
p "AAA".empty?
