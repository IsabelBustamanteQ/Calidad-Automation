
#   When I visit https://demo.borland.com/gmopost/
When('I visit {string}') do |urlToSearch|
  visit(urlToSearch)
end
#   Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
Then('I see text that says {string}') do |welcomeMessage|
  welcomeMessageLabel = find(:xpath, '/html/body/p[1]/font/em')
  puts "ONLY FOR TEST PURPOSES:"+welcomeMessageLabel.text
  if welcomeMessageLabel.text != welcomeMessage
    	raise "Working hours should be"+welcomeMessage	
  end
end