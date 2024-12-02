Given(/^I am on the online catalog homepage$/) do
  page.driver.browser.manage.window.maximize
  visit('https://demo.borland.com/gmopost/online-catalog.htm') 
end

When(/^I select "([^"]*)"$/) do |quantities_and_items_name|
  items_and_quantities = quantities_and_items_name.split(',').map(&:strip)
  @selected_items = {}

  items_and_quantities.each do |item_and_quantity|
    quantity, item_name = item_and_quantity.split(' ', 2)
    catalog_table = find(:xpath, "/html/body/form/table/tbody/tr[2]/td/div/center/table")
    catalog_rows = catalog_table.all(:xpath, "tbody/tr")
    catalog_rows.each_with_index do |row, index|
      if index > 0         
        if row.find(:xpath, "td[2]/a/strong").text == item_name.strip
          price_text = row.find(:xpath, "td[3]").text
          price_unit = price_text.gsub('$', '').strip.to_f
  
          @expected_total ||= 0
          @expected_total += price_unit * quantity.to_i
  
          quantity_input = row.find(:xpath, "td[4]/h1/input")
          quantity_input.set(quantity)
  
          @selected_items[item_name.strip] = quantity.to_i
  
          break
        end
      end
    end
  end
end


When(/^I click the "([^"]*)" button$/) do |button_text|
  click_button(button_text)
end


Then(/^all quantities should be reset to "0"$/) do
  all('input[type="text"]').each do |field|
    expect(field.value).to eq('0')
  end
end


Then(/^the selected items with their respective quantities should appear in the order summary$/) do
  summary_table = find(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table")
  summary_rows = summary_table.all(:xpath, "tbody/tr")

  summary_rows.each_with_index do |row, index|
    if index < summary_rows.length - 4 && index > 0
      row = summary_rows[index] 
      description_in_row = row.find(:xpath, "td[2]").text.strip
      quantity_in_row = row.find(:xpath, "td[1]").text.strip

      expect(@selected_items).to have_key(description_in_row)

      expected_quantity = @selected_items[description_in_row].to_s
      expect(quantity_in_row).to eq(expected_quantity)
    end
  end
end


Then(/^the total price should be calculated correctly$/) do
  formatted_total = "$ #{'%.2f' % @expected_total}"
  table = find(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table")
  rows = table.all(:xpath, "tbody/tr")
  product_total_cell = find(:xpath, "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[#{rows.length - 3}]/td[3]")
  expect(product_total_cell.text).to eq(formatted_total)
end
