=begin
	pushData(pushNode,is4)
	切断数据，去除空格，留下有效数据
=end
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

=begin
	findTimeData(s_data,s_time,isEnd)
	查找对应时间的数据
=end
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

=begin
	spiderData(mProject)
	组合对应项目的数据
=end
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
		web_data += $date.to_s + "|"
		t = tempArray[i][1] 
		web_data += t + ","

		web_data += findTimeData(rk,t,false)
		web_data += findTimeData(ck,t,false)
		web_data += findTimeData(sy,t,false)
		web_data += findTimeData(xy,t,true)

		i += 1
	end

	m_path = "/home/Napoleon/SpiderData/"
	#m_path = "./"
	if not Dir.exist?(m_path)
		Dir.mkdir(m_path)
	end

	new_file = File.exist?(m_path + t_filename + "(" + $date.year.to_s + "年度).csv")
	f = File.open(m_path + t_filename + "(" + $date.year.to_s + "年度).csv","a:GB2312")
	if not new_file then f.write(t_title) end
	#puts web_data.encoding
	f.write(web_data)
	f.close
	print $date.to_s + " " + t_filename + "数据已保存成功！\n"
end

=begin
	日志保存，保存网站访问情况
=end
def saveLog(log_note)
	f = File.open("spider.log","a")
	f.write(log_note)
	f.close
end

=begin
	判断起始日期
=end
def getCheckDate(check_year)
	no_err_date = (Date.new(check_year.to_i,1,1)..Date.new(check_year.to_i,12,31))

	# 1. 日志文件不存在，肯定没有ERR，那肯定从新采集
	if not File.exist?("spider.log")
    #p 1
		return no_err_date
	end

	r_year = Regexp.new(check_year.to_s + "-*")
  #p r_year
  checkArray = []
	open("spider.log","r") do |f|
		checkArray = f.readlines.select { |a| a =~ r_year }
	end
	#p checkArray

	# 2. 日志文件存在，没有对应年份数据，代表没有采集过
	if checkArray.empty?
    #p 2
		return no_err_date
	end

=begin
  判断太罗嗦，不简练
  errArray = checkArray.select { |v| v =~ /ERR/ }
	if errArray.empty?
		if checkArray.last.split("|")[0] == check_year + "-12-31"
		  # 3. 日志文件存在，有年份数据，没有ERR，但是已经结束
      p 3
			print check_year + " 年度数据已经完全正常采集，无需再次采集，谢谢使用。\n"
			exit
		else
		  # 4. 日志文件存在，有年份数据，没有ERR，但是没有结束
      p 4
			at_date = checkArray.last.split("|")[0]
			next_date = Date.parse(at_date) + 1
			print check_year + " 年度数据已经采集到 " + at_date + " ，将从 " + next_date.to_s + " 继续采集。\n"
			return (next_date..Date.new(check_year.to_i,12,31))
		end
	else
    if checkArray.last.split("|")[0] == errArray.last.split("|")[0]
		  # 5. 日志文件存在，有年份数据，有ERR，且最后一个ERR，也是该年份数据最后一项
      p 5
  		at_date = errArray.last.split("|")[0]
	    print check_year + " 年度数据采集到 " + at_date + " 时发生错误，将从 " + at_date + " 继续采集。\n"
  		return (Date.parse(at_date)..Date.new(check_year.to_i,12,31))
    else
      # if 是否最后一天
      #   已经采集结束
      # else
      #   从那天之后取数据
      # end
    end
	end
=end
  
  l_Array = checkArray.last.split("|")
  #p l_Array
  if (l_Array[0] == check_year + "-12-31") and (l_Array[2].chomp == "OK")
    # 3. 日志文件存在，有年份数据，当前最后没有ERR（允许之前有错误），但是已经结束
    #p 3
		print check_year + " 年度数据已经完全正常采集，无需再次采集，谢谢使用。\n"
		exit
  elsif (l_Array[0] != check_year + "-12-31") and (l_Array[2].chomp == "OK")
		# 4. 日志文件存在，有年份数据，当前最后没有ERR（允许之前有错误），但是没有结束
    #p 4
		at_date = l_Array[0]
		next_date = Date.parse(at_date) + 1
		print check_year + " 年度数据已经采集到 " + at_date + " ，将从 " + next_date.to_s + " 继续采集。\n"
		return (next_date..Date.new(check_year.to_i,12,31))
  elsif l_Array[2].chomp =~ /ERR/
    # 5. 日志文件存在，有年份数据，当前最后有ERR（允许之前也有错误）
    #p 5
  	at_date = l_Array[0]
	  print check_year + " 年度数据采集到 " + at_date + " 时发生错误，将从 " + at_date + " 重新采集。\n"
  	return (Date.parse(at_date)..Date.new(check_year.to_i,12,31))
  end
end

=begin
	main 
=end
require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")

require 'date'
require 'nokogiri'
begin
	print "要采集数据的年度:"
	m_year = gets
end while m_year.strip.empty?

#dateBegin = Date.new(m_year.to_i,1,1)
#dateEnd = Date.new(m_year.to_i,12,31)
#-----------------------------------------------------------
dateRange = getCheckDate(m_year.chomp)
#p dateRange
#exit

#(dateBegin..dateEnd).each do |dateSpider|
dateRange.each do |dateSpider|
	print "\n------>>> " + dateSpider.to_s + " 数据请求中 <<<-----\n"

	m_try = 0
	begin
		res = Net::HTTP.post_form(uri,'NeedCompleteTime2' => dateSpider.to_s)
	rescue => e #Net::HTTPRequestTimeOut 
		if m_try == 0
			print "Error: ----->>> " + dateSpider.to_s + " 数据请求失败！ <<<-----\n"
		elsif m_try < 3 
			print "Error: ----->>> " + dateSpider.to_s + " 数据请求失败！ <<<-----(第 " + m_try.to_s + " 次重试)\n"
		else
			print "Error: ----->>> " + dateSpider.to_s + " 数据请求失败！请稍后再试！！\n"
			saveLog(dateSpider.to_s + "|GetData|ERR(" + e.to_s + ")\n")
			#raise
			exit
		end
		m_try += 1
		retry
	end
	saveLog(dateSpider.to_s + "|GetData|OK\n")
	#puts res.body
	#puts res.code
	print dateSpider.to_s + " 数据请求返回：" + res.message + " !\n"

	doc = Nokogiri::HTML(res.body, encoding="UTF-8")
	$node = doc.css("table.top_t")
	$date = dateSpider

	spiderData("sx")
	spiderData("gz")
	spiderData("xj")
	spiderData("xl")
end
