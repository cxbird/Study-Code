font_table = {"normal"=>"+0","small"=>"-1","big"=>"+1"}
p font_table
p font_table["small"]
p font_table["normal"]
p font_table["big"]
font_table["verybig"]=2		#可以追加hash数据，可以存数值
print "p and pp function in Hash---------------\n"
p font_table
require "pp"
pp font_table
print "p and pp function in array--------------\n" #pp函数只要对太长的字符换行，字符不长，和p输出一样。
v=[font_table]
p v
pp v
p v.class
v=[{"key_00"=>"kuailexuexi Ruby di2ban",
"key_01"=>"Ruby shipu",
"key_02"=>"jile Ruby"}]
p v
pp v
v[1]=font_table
p v
pp v
print "----------------------------------------\n"
p font_table["bigbigbig"]	#输出未定义的hash，将输出nil
print "each function --------------------------\n"
print "<html><title>font size list</title>"
print "<body>\n<p>\n"
font_table.each {|key,value|
    print '<font size="',value,'">',key,'</font><br>',"\n"
}
print "</p></body></html>\n"
print "----------------------------------------\n"
p font_table.class
p font_table["big"].class
p font_table["verybig"].class
p font_table["big-a"].class
