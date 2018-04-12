#utile pour que le script tourne 
require 'open-uri'
require 'nokogiri'



#definition de cours_cryptomonnaies
def cours_cryptomonnnaies(page_url)
    doc = Nokogiri::HTML(open(page_url))
#on instance le cour dans une tableaux vide
    cours = []
#on recupere le css de #currencies-all tbody tr"
    el_tab = doc.css("#currencies-all tbody tr")
#puis on parcour un à un les tr
    for i in 0...el_tab.length do
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        cours.push({
#pour ordonner les donnée on les a ajouté dans des symboles
            :name => x[2],
            :symbol => x[1],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        })
        puts cours

#ce puts est nécessaires pour chaque donnée recuperer long
        puts "Patientez SVP ##################### Ce sera long je vous assure"
    end

    puts "RESULTAT---------Tr"
    cours
end


while 0 < 1 do
    puts cours_cryptomonnnaies("https://coinmarketcap.com/all/views/all/")
    puts "PAUSE"
    sleep 3600
end