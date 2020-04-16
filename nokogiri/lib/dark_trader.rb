require 'open-uri'
require 'nokogiri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# Identification of money and value from the page 
website_money = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody//td[2]/div/a')
website_value = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody//td[4]')

#Save money and value into table 
crypto_name_array =[]
crypto_value_array =[]

website_money.each do |el|
	crypto_name_array << el.text
end

website_value.each do |el|
	crypto_value_array << el.text
end

# Create a Hash with money and value table
result = Hash.new
result = Hash[crypto_name_array.zip(crypto_value_array)]


