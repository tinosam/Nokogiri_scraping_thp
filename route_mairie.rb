require 'open-uri'
require 'nokogiri'



#doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))



puts "### Search for email Vaureal"
def get_the_email_of_a_townhal_from_its_webpage(page_url)
	doc = Nokogiri::HTML(open(page_url))
	email = doc.css(".tr-last")[3].text.split(" ")[2]
	email
end

puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")



puts "### Search for url Vaureal"
def get_all_the_urls_of_val_doise_townhalls(page_url)
	doc = Nokogiri::HTML(open(page_url))
	lien = doc.css("a[class=lientext],href").text.split(" ")[1]
	lien
end

puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")	

