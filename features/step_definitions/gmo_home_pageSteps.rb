
#   When I visit https://demo.borland.com/gmopost/
When('I visit GMO OnLine') do
  visit('https://demo.borland.com/gmopost/')
end
# Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
Then(/^I see a text that says "([^"]*)"$/) do |contentMessage|
  expect(page).to have_content(contentMessage)
end
  # And I see a button that says "Enter GMO OnLine"
Then (/^I see a button that says "([^"]*)"$/) do |buttonMessage|
  expect(page).to have_button(buttonMessage)
end
# And I will click "Enter GMO OnLine" button
When(/^I will click "([^"]*)" button$/) do |enterButton|
  click_button(enterButton)
end
# And I see a table with products to buy
Then('I see a table with products to buy') do
  address = find(:xpath, '/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[2]/td[2]/a')
  
  if address.text != "3 Person Dome Tent"
    raise "Product not found"
  end
end
