require 'open-uri'
require 'nokogiri'


# function which get the eamil from townhall_url
def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	return email.text
end


#Function which get all the townhall url from the departement_url
def get_townhall_url(department_url)
	adress_tab =[]
	page2 = Nokogiri::HTML(open(department_url))
	url = page2.xpath('//a[@class="lientxt"]/@href')
	url.each do |string|
		string = string.to_s[1..-1]
		adress = "https://www.annuaire-des-mairies.com"+string
		adress_tab << adress
	end
	return adress_tab
end

#get_townhall_url("https://www.annuaire-des-mairies.com/val-d-oise.html")
#get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")

#//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[6]
def main(department_url)
	list_townhall_url = get_townhall_url(department_url)
	list_townhall_url.each do |url|
		 puts get_townhall_email(url)
		end
end

main("https://www.annuaire-des-mairies.com/val-d-oise.html")