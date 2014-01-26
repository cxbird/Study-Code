def pushData(pushNode,is4)
	i = pushNode.children.count - 1
	if i == 0 then
		#只有标题，没有数据，返回空数组
		return []
	end

	if is4 then
		dataBegin = 2
	else
		dataBegin = 1
	end

	dataArray = []
	while i >= dataBegin
		splitTemp = pushNode.children[i].text.sub(/[[:space:]]/,"").split 
		dataArray << [ splitTemp[0].sub(/[[:blank:]]/,"") , splitTemp[1].sub(/[[:blank:]]/,"") ]
		i -= 1
	end

	return dataArray
end

def findTimeData(s_data,s_time,isEnd)
	dataTemp = s_data.rassoc(s_time)
	t_char = ","
	if isEnd then t_char = "\n" end

	if dataTemp.nil?
		return t_char
	else
		return dataTemp[0] + t_char
	end
end

def spiderData(mProject)
	case mProject
	when "sx"
		# -------------- SX ---------------
		t_title = "日期|时间,三峡入库流量,三峡出库流量,三峡上游水位,三峡下游水位\n"
		t_filename = "三峡"
		rk = pushData($node[1],false)
		#p rk.count
		ck = pushData($node[2],false)
		#p ck.count
		sy = pushData($node[3],false)
		#p sy.count
		xy = pushData($node[4],true)
		#p xy.count
	when "gz"
		# -------------- GZ ---------------
		t_title = "日期|时间,葛洲坝入库流量,葛洲坝出库流量,葛洲坝上游水位,葛洲坝下游水位\n"
		t_filename = "葛洲坝"
		rk = pushData($node[5],false)
		#p rk.count
		ck = pushData($node[6],false)
		#p ck.count
		sy = pushData($node[11],false)
		#p sy.count
		xy = pushData($node[12],false)
		#p xy.count
	when "xj"
		# -------------- XJ ---------------
		t_title = "日期|时间,向家坝入库流量,向家坝出库流量,向家坝上游水位,向家坝下游水位\n"
		t_filename = "向家坝"
		rk = pushData($node[7],false)
		#p rk.count
		ck = pushData($node[8],false)
		#p ck.count
		sy = pushData($node[13],false)
		#p sy.count
		xy = pushData($node[14],false)
		#p xy.count
	when "xl"
		# -------------- XL ---------------
		t_title = "日期|时间,溪洛渡入库流量,溪洛渡出库流量,溪洛渡上游水位,溪洛渡下游水位\n"
		t_filename = "溪洛渡"
		rk = pushData($node[9],false)
		#p rk.count
		ck = pushData($node[10],false)
		#p ck.count
		sy = pushData($node[15],false)
		#p sy.count
		xy = pushData($node[16],false)
		#p xy.count
	end

	max_x = [[rk.count,"rk"],[ck.count,"ck"],[sy.count,"sy"],[xy.count,"xy"]].max
	tempArray = case max_x[1]
							when "rk" then rk
							when "ck" then ck
							when "sy" then sy
							when "xy" then xy
							end
	#p tempArray

	# 数据转存
	web_data = ""
	# 时间
	t = "" 

	i = 0
	while i < max_x[0]
		#puts i
		web_data += "2014-04-24|"
		t = tempArray[i][1] 
		web_data += t + ","

		web_data += findTimeData(rk,t,false)
		web_data += findTimeData(ck,t,false)
		web_data += findTimeData(sy,t,false)
		web_data += findTimeData(xy,t,true)

		i += 1
	end

	new_file = File.exist?(t_filename + "(2014-04).csv")
	f = File.open(t_filename + "(2014-04).csv","a:GB2312")
	if not new_file then f.write(t_title) end
	#puts web_data.encoding
	f.write(web_data)
	f.close
	print "2014-04-24 " + t_filename + "数据保存已成功！\n"
end

# Post Data for require.
require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")
res=Net::HTTP.post_form(uri,'NeedCompleteTime2' => '2014-04-24')
#puts res.body
#puts res.code
print "2014-04-24 数据请求返回：" + res.message + "! 数据处理中…………\n"

# Nokogiri GEM 加载
require "nokogiri"
doc = Nokogiri::HTML(res.body, encoding="UTF-8")
$node = doc.css("table.top_t")

spiderData("sx")
spiderData("gz")
spiderData("xj")
spiderData("xl")
