require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage(page_url)
    doc = Nokogiri::HTML(open(page_url))
    email = doc.css(".tr-last")[3].text.split(" ")[2]
    email
end


puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")


def get_all_the_urls_of_val_doise_townhalls(page_url)
    doc = Nokogiri::HTML(open(page_url))
    urls = []
    get_urls = doc.css("a[class=lientxt]")
    get_urls.each{|link| urls.push("http://annuaire-des-mairies.com"+link['href'][1...link['href'].length])}
    urls
end

puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com")

