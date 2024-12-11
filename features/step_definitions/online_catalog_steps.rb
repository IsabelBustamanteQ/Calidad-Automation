Given(/^I am on the GMO OnLine Page$/) do
  expect(@gmo_home_page.on_home_page?).to be true
end

Given(/^I am on the online catalog homepage$/) do
  expect(@catalog_page.on_catalog_page?).to be true
end

When(/^I select "([^"]*)"$/) do |quantities_and_items_name|
  items_and_quantities = quantities_and_items_name.split(',').map(&:strip)
  @selected_items = {}

  items_and_quantities.each do |item_and_quantity|
    quantity, item_name = item_and_quantity.split(' ', 2)
    item = @catalog_page.select_item_quantity(item_name.strip, quantity.to_i)
    @selected_items[item[:item_name]] = item[:quantity]
    @expected_total ||= 0
    @expected_total += item[:price_unit] * item[:quantity]
  end
end

When(/^I select the item "([^"]*)" and set the quantity to "([^"]*)"$/) do |item_name, quantity|
  item = @catalog_page.select_item_quantity(item_name.strip, quantity.strip)
  @selected_items[item[:item_name]] = item[:quantity]
  @expected_total += item[:price_unit] * item[:quantity]
end

When(/^I click the "([^"]*)" button$/) do |button_text|
  @catalog_page.click_button_by_text(button_text)
end

Then(/^all quantities should be reset to "0"$/) do
  expect(@catalog_page.all_quantities_reset_to?(0)).to be true
end


Then(/^I should see the item "([^"]*)" with quantity "([^"]*)" in the order summary$/) do |item_name, quantity|
  expect(@place_order_page.verify_order_summary(@selected_items)).to be true
end

Then(/^the total price should be calculated correctly$/) do
  expected_total = @catalog_page.get_total_price(@selected_items)
  expect(@place_order_page.verify_total_price(expected_total)).to be true
end

Then(/^the total price should be "([^"]*)"$/) do |total_price|
  expected_total = @catalog_page.get_total_price(@selected_items)
  puts expected_total
  expect(@place_order_page.verify_total_price(expected_total)).to be true and expect(expected_total).to eq(total_price.to_f)
end

Then(/^I should see an alert with the message "([^"]*)"$/) do |expected_message|
  expect(@catalog_page.verify_alert_message(expected_message)).to be true
end
