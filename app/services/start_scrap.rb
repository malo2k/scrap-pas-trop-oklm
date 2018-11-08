class StartScrap
	
require 'open-uri'
require 'nokogiri'




def get_prices(page) 
  @prices = []
  page.css("a.price").each do |price| 
    @prices << price.text 
  end
  return @prices 
end

def get_cryptos(page) 
  @cryptos = []
  page.css("a.currency-name-container").each do |crypto| 
    @cryptos << crypto.text 
  end
  return @cryptos
end

def perform
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))
  tab = Hash[get_cryptos(page).zip(get_prices(page))]
  return tab
end

end