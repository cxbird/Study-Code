#!/usr/bin/env ruby
class RingArray < Array
  def [](i)
    idx=i % size
    print  "idx=",idx
    super(idx)
  end
end

eto = RingArray["子","丑","寅yin","卯","辰","巳si",
	"午","未","申","酉you","戌xu","亥"]
p eto[6]
p eto[11]
p eto[15]
p eto[-1]
