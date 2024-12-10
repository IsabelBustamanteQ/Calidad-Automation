require_relative '../pages/billing_page'

# Initialize the page object
Before do
  @billing_page = BillingPage.new
end

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
  @billing_page.fill_billing_form(table.rows_hash)
end

When('I fill in the billing form without providing mandatory fields') do |table|
  billing_data = table.rows_hash
  @billing_page.fill_billing_form(billing_data)
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

Then('I should see the order confirmation page with different bill,ship data') do
  expect(@billing_page.order_confirmation_present?).to be true
end