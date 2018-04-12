#utile pour que le script tourne 
require 'open-uri'
require 'nokogiri'


#ici commence la methode get_the_email_of_a_townhal_from_its_webpage
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    doc = Nokogiri::HTML(open(page_url))
    email = doc.css(".tr-last")[3].text.split(" ")[2]
    email
end

#ici commence la methode get_all_the_urls_of_val_doise_townhalls
def get_all_the_urls_of_val_doise_townhalls(page_url)
    doc = Nokogiri::HTML(open(page_url))
    urls = []
#on recupere le css a[class=lientxt]
    get_urls = doc.css("a[class=lientxt]")
    get_urls.each{|link| urls.push("http://annuaire-des-mairies.com"+link['href'][1...link['href'].length])}
    urls
end

#script pour associer les deux methode pour une vue bien ordonnée
def get_email()
    mairies = []
    tab_link = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
    tab_link.each do
        |link|
        mairie = Nokogiri::HTML(open(link)).css('main h1')[0].text.split(" ")[0]
        mairies.push({
            :name => mairie,
            :email => get_the_email_of_a_townhal_from_its_webpage(link)
        })
            puts mairies
    end
    puts "Resusltat"
    mairies
end


#et on affiche le resultat
puts get_email