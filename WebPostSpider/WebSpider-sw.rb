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
    web_data += $date.to_s + "|"
    t = tempArray[i][1] 
    web_data += t + ","

    web_data += findTimeData(rk,t,false)
    web_data += findTimeData(ck,t,false)
    web_data += findTimeData(sy,t,false)
    web_data += findTimeData(xy,t,true)

    i += 1
  end

  if not Dir.exist?("/home/Napoleon/SpiderData/")
    Dir.mkdir("/home/Napoleon/SpiderData")
  end

  new_file = File.exist?("/home/Napoleon/SpiderData/" + t_filename + "(" + $date.year.to_s + "年度).csv")
  f = File.open("/home/Napoleon/SpiderData/" + t_filename + "(" + $date.year.to_s + "年度).csv","a:GB2312")
  if not new_file then f.write(t_title) end
  #puts web_data.encoding
  f.write(web_data)
  f.close
  print $date.to_s + " " + t_filename + "数据已保存成功！\n"
end

# Post Data for require.
require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")

require 'date'
require 'nokogiri'
begin
  print "要采集数据的年度:"
  m_year = gets
end while m_year.strip.empty?

dateBegin = Date.new(m_year.to_i,1,1)
dateEnd = Date.new(m_year.to_i,12,31)
(dateBegin..dateEnd).each do |dateSpider|
  print "\n------> " + dateSpider.to_s + " 数据请求中 ………… <-----\n"
  res=Net::HTTP.post_form(uri,'NeedCompleteTime2' => dateSpider.to_s)
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
