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

# Post Data for require.
require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")
res=Net::HTTP.post_form(uri,'NeedCompleteTime2' => '2005-01-01')
#puts res.body
#puts res.code
print "2005-01-01 数据请求返回：" + res.message + "\n"

# Nokogiri GEM 加载
require "nokogiri"
doc = Nokogiri::HTML(res.body, encoding="UTF-8")
node = doc.css("table.top_t")

# -------------- SX ---------------
rk = pushData(node[1],false)
#p rk.count
ck = pushData(node[2],false)
#p ck.count
sy = pushData(node[3],false)
#p sy.count
xy = pushData(node[4],true)
#p xy.count

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
  web_data += "2005-01-01|"
  t = tempArray[i][1] 
  web_data += t + ","

  web_data += findTimeData(rk,t,false)
  web_data += findTimeData(ck,t,false)
  web_data += findTimeData(sy,t,false)
  web_data += findTimeData(xy,t,true)

  i += 1
end

f = File.open("sx-2005-01.csv","a:GB2312")
f.write("日期|时间,三峡入库流量,三峡出库流量,三峡上游水位,三峡下游水位\n")
#puts web_data.encoding
f.write(web_data)
f.close
print "2005-01-01 数据保存已成功！\n"
