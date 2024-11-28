
#   When I visit https://demo.borland.com/gmopost/
When('I visit {string}') do |urlToSearch|
  visit(urlToSearch)
end
# Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
Then(/^I see a text that says "([^"]*)"$/) do |welcomeMessage|
  expect(page).to have_content(welcomeMessage)
end