#Given I am on the Google homepage
Given(/^I am on the Google homepage$/) do
  @gmo_home_page.visit_google_homepage
end
#   When I visit https://demo.borland.com/gmopost/
When('I visit GMO OnLine') do
  @gmo_home_page.visit_gmo_online
end
# Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
Then(/^I see a text that says "([^"]*)"$/) do |contentMessage|
  expect(@gmo_home_page.has_content?(contentMessage)).to be true
end
  # And I see a button that says "Enter GMO OnLine"
Then (/^I see a button that says "([^"]*)"$/) do |buttonMessage|
  expect(@gmo_home_page.has_button?(buttonMessage)).to be true
end
# And I will click "Enter GMO OnLine" button
When(/^I will click "([^"]*)" button$/) do |enterButton|
  @gmo_home_page.click_button_by_name(enterButton)
end
# And I see a table with products to buy
Then('I see a table with products to buy') do
  expect(@catalog_page.has_products?).to be true
end
