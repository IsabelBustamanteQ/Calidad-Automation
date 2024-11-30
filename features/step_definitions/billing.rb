require 'capybara/cucumber'

Given('I am on the billing information page') do
  visit 'https://demo.borland.com/gmopost/'
end

When('I fill in the billing form with valid details') do |table|
  table.rows_hash.each do |field, value|
    fill_in field, with: value
  end
end