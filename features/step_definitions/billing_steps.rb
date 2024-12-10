require_relative '../pages/billing_page'

Given('I am on the billing information page') do
  @billing_page.visit_page
end

When('I fill in the billing form with valid details') do |table|
  @billing_page.fill_billing_form(table.rows_hash)
end

When('I fill in the billing form with invalid details') do |table|
  @billing_page.fill_billing_form(table.rows_hash)
end

When('I fill in the billing form with edge-case details') do |table|
  @billing_page.fill_billing_form(table.rows_hash)
end

When('I fill in the billing form with invalid phone number') do |table|
    base_data = {
        'Name' => 'John Doe',
        'Address' => '123 Main St',
        'City' => 'Springfield',
        'State' => 'IL',
        'Zip' => '62704',
        'E-mail' => 'john@example.com',
        'Card Type' => 'Visa',
        'Card Number' => '4111111111111111',
        'Expiration' => '12/99'
    }
    # Override phone with the test data
    phone_data = table.rows_hash
    base_data['Phone'] = phone_data['Phone']
      
    @billing_page.fill_billing_form(base_data)
end

When('I fill in the billing form without providing mandatory fields') do |table|
    base_data = {
    'E-mail' => 'john@example.com',
    'Card Type' => 'Visa',
    'Card Number' => '4111111111111111',
    'Expiration' => '12/99'
  }
  
  # Override with provided data (which will be empty)
  mandatory_data = table.rows_hash
  base_data.merge!(mandatory_data)
  
  @billing_page.fill_billing_form(base_data)

end

When('I fill in the shipping form with valid details') do |table|
  @billing_page.fill_shipping_form(table.rows_hash)
end

When('I check the "Same as Bill To" checkbox') do
  @billing_page.check_same_as_bill_to
end

When('I uncheck the "Same as Bill To" checkbox') do
  @billing_page.uncheck_same_as_bill_to
end

When('I leave the shipping form empty') do
  @billing_page.leave_shipping_form_empty
end

And('I submit the form') do
  @billing_page.submit_form
end

Then('I should see an alert with the text {string}') do |expected_text|
  actual_text = @billing_page.get_alert_text
  expect(actual_text).to eq(expected_text)
end

Then('I should see the order confirmation page') do
  expect(@billing_page.order_confirmation_present?).to be true
end

Then('I should see the order confirmation page with different billing and shipping data') do
  expect(@billing_page.order_confirmation_present?).to be true
end