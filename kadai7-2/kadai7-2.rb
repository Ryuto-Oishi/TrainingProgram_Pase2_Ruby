require "nokogiri"
require "open-uri"

url = "https://www.kurobe-dam.com/"
doc = Nokogiri::HTML.parse(URI.open(url))

finding_image = "img_sightseeing.jpg"
img_path = String.new
doc.xpath('.//img[@src]').each do |element|
  if element.attribute('src').value.include?(finding_image)
    img_path = element.attribute('src').value
  end
end

File.open("./"+finding_image, "w") do |file|
  file.write(URI.open(url+img_path).read)
end
