require "nokogiri"
require "open-uri"

doc = Nokogiri::HTML.parse(URI.open("https://www.kurobe-dam.com/"))
doc.css("img @src").each do |element|
  if element.value.include?(".png")
    puts element.value
  end
end
