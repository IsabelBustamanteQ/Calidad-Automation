Then (/^I see a warning that says "([^"]*)"$/) do |warning_message|
  @about_page = AboutThisSitePage.new
  expect(@about_page.has_warning_message?(warning_message)).to be true
end


Then('I see a table with the technologies used by this site') do
  @about_page ||= AboutThisSitePage.new
  expect(@about_page.rows_have_information?).to be true
end