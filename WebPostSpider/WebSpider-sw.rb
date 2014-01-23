require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")
res=Net::HTTP.post_form(uri,'NeedCompleteTime2' => '2013-01-01')
#puts res.body
puts res.code
puts res.message

#IO.write("testfile",res.body)
require "nokogiri"
doc = Nokogiri::HTML(res.body, encoding="UTF-8")
#doc.css("table.top_t").each do |node|
#  node
#end

node = doc.css("table.top_t")
f=File.open("sx-2013-01.csv","a")
f.write("2013-01-01 " + node[1].children[1].text.split[1].strip+","+node[1].children[1].text.split[0].strip+ "\n")
f.close
