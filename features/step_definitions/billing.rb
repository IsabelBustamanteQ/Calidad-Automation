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

When('I fill in the billing form with invalid details') do |table|
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

Then('I should see an alert with the text {string}') do |string|
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq(string)
    alert.accept
    # sleep(10)  # Pause for 2 seconds
end

# Helper function for email validation
def valid_email_format?(email)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email_regex.match?(email)
end

When('I fill in the billing form without providing mandatory fields') do |table|
    billing_data = table.rows_hash
    fill_in 'billName', with: '' if billing_data['Name'].nil?
    fill_in 'billEmail', with: '' if billing_data['E-mail'].nil?
end

When('I leave the shipping form empty') do
    fill_in 'shipName', with: ''
    fill_in 'shipAddress', with: ''
    fill_in 'shipCity', with: ''
    fill_in 'shipState', with: ''
    fill_in 'shipZipCode', with: ''
    fill_in 'shipPhone', with: ''
end

# Fill in the billing form with edge-case details
When('I fill in the billing form with edge-case details') do |table|
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

# Fill in the billing form with an invalid phone number
When('I fill in the billing form with invalid phone number') do |table|
    billing_data = table.rows_hash
    fill_in 'billPhone', with: billing_data['Phone']
end

# Fill in the billing form with an invalid email
When('I fill in the billing form with an invalid email') do |table|
    billing_data = table.rows_hash
    fill_in 'billEmail', with: billing_data['E-mail']
end

  
And('I check the "Same as Bill To" checkbox') do
    # sleep(10)  # Pause for 2 seconds comment for production
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

Then('I should see the order confirmation page with different bill,ship data') do
    expect(page).to have_content('Thank you for shopping with Green Mountain Outpost')
end
# Then('I should see the order confirmation page') do
#     expect(page).to have_content('Thank you for shopping with Green Mountain Outpost')
#     expect(page).to have_content('John Doe')
# end
Then('I should see the order confirmation page') do |table|
    billing_data = table.rows_hash
    
    # Verify the confirmation message
    expect(page).to have_content('Thank you for shopping with Green Mountain Outpost')
    
    # Dynamically verify the name from the input data
    expect(page).to have_content(billing_data['Name'])
  end