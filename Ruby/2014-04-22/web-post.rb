require 'net/http'
uri=URI("http://www.ctg.com.cn/inc/sqsk.php")
res=Net::HTTP.post_form(uri,'NeedCompleteTime2' => '2013-01-01')
#puts res.body
puts res.code
puts res.message

IO.write("testfile",res.body)
