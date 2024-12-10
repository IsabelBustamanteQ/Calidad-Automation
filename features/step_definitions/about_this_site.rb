# Then I see the About The GMO Site
Then ("I see the About The GMO Site") do 
  expect(@about_page.on_about_this_site_page?).to be true
end
# And I see a warning that says "DO NOT ENTER REAL BILLING OR SHIPPING INFORMATION"
Then (/^I see a warning that says "([^"]*)"$/) do |warning_message|
  expect(@about_page.has_warning_message?(warning_message)).to be true
end

# And I see a table with the technologies used by this site
Then('I see a table with the technologies used by this site') do
  expect(@about_page.rows_have_information?).to be true
end