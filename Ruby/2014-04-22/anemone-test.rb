#!/usr/bin/env ruby
require "anemone"

Anemone.crawl("http://www.powerfoo.com") do |anemone|
  anemone.on_every_page do |page|
    puts page.url
  end
end
