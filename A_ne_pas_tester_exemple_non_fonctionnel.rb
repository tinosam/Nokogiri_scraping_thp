=begin

def get_all_the_urls_of_val_doise_townhalls(page_url)
doc = Nokogiri::HTML(open(page_url))
lien = []
recup_lien =doc.css("a[class=lientext]")
recup_lien.each{ |url| link.push("http://annuaire-des-mairies.com/val-d-oise.html"+url['href'][1...url['href']].length) }
lien
end

puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
=end




=begin
doc.xpath('//h1').each do |node|
puts node.text
end
=end

#doc.css('td')[3].text
#puts doc.text




=begin
puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
puts link.content
end
=end
