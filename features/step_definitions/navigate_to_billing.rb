When('I click the Proceed With Order button') do
  @place_order_page.click_order_button
end

Then('I should see the billing information page') do
  expect(@billing_page.on_billing_page?).to be true
end