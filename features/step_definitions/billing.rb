require 'capybara/cucumber'

Given('I am on the billing information page') do
  visit 'https://demo.borland.com/gmopost/'
end

When('I fill in the billing form with valid details') do |table|
  billing_data = table.rows_hash
  fill_in 'billName', with: billing_data['Name']
  fill_in 'billAddress', with: billing_data['Address']
  fill_in 'billCity', with: billing_data['City']
  fill_in 'billState', with: billing_data['State']
  fill_in 'billZipCode', with: billing_data['Zip']
  fill_in 'billPhone', with: billing_data['Phone']
  fill_in 'billEmail', with: billing_data['E-mail']
  select billing_data['Card Type'], from: 'CardType'
  fill_in 'CardNumber', with: billing_data['Card Number']
  fill_in 'CardDate', with: billing_data['Expiration']
end

When('I check the "Same as Bill To" checkbox') do
    check 'shipSameAsBill'
end

When('I fill in the shipping form with valid details') do |table|
    shipping_data = table.rows_hash

    # Fill in shipping fields manually
    fill_in 'shipName', with: shipping_data['Name']
    fill_in 'shipAddress', with: shipping_data['Address']
    fill_in 'shipCity', with: shipping_data['City']
    fill_in 'shipState', with: shipping_data['State']
    fill_in 'shipZipCode', with: shipping_data['Zip']
    fill_in 'shipPhone', with: shipping_data['Phone']
end

When('I uncheck the "Same as Bill To" checkbox') do
    uncheck 'shipSameAsBill'
end

And('I submit the form') do
    click_button 'bSubmit'
end

Then('I should see a confirmation message {string}') do |message|
    expect(page).to have_content(message)
end