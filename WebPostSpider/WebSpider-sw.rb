# Post Data for require.
require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")
res=Net::HTTP.post_form(uri,'NeedCompleteTime2' => '2005-01-01')
#puts res.body
puts res.code
puts res.message

# Nokogiri GEM 加载
#IO.write("testfile",res.body)
require "nokogiri"
doc = Nokogiri::HTML(res.body, encoding="UTF-8")
node = doc.css("table.top_t")

max_h = [[node[1].children.count,1],[node[2].children.count,2],[node[3].children.count,3],[node[4].children.count,4]].max

puts max_h
puts max_h[0].class

i=2
web_data = ""
while i < max_h[0]
	puts i,max_h[0]
	web_data += "2005-01-01|" + node[max_h[1]].children[i].text.sub(/[[:space:]]/,"").split[1].sub(/[[:blank:]]/,"") + ",\n"
	i=i+1
end

f=File.open("sx-2005-01.csv","a")
f.write("日期|时间,三峡入库流量,三峡出库流量,三峡上游水位,三峡下游水位\n")
f.write(web_data)
f.close
