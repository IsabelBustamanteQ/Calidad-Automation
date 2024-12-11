class PlaceOrderPage
  include Capybara::DSL

  def initialize
    @order_summary_table_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table"
    @order_button = "Proceed With Order"
  end

  def on_place_order_page?
    has_content?("Place Order") && has_button?(@order_button) && has_table?(@order_summary_table_xpath)
  end

  def verify_order_summary(selected_items)
    summary_table = find(:xpath, @order_summary_table_xpath)
    rows = summary_table.all(:xpath, "tbody/tr")

    selected_items.each do |item_name, quantity|
      matching_row = rows.find do |row|
        product_description = row.find(:xpath, "td[2]").text.strip
        qty = row.find(:xpath, "td[1]").text.strip.to_i
        product_description == item_name && qty == quantity
      end

      return false unless matching_row
    end
    true
  end
  
  def verify_total_price(expected_total)
    summary_table = find(:xpath, @order_summary_table_xpath)
    rows = summary_table.all(:xpath, "tbody/tr")
    total_price_element = summary_table.find(:xpath, "tbody/tr[#{rows.length - 3}]/td[3]")
    displayed_total = total_price_element.text.gsub("$", "").to_f

    displayed_total == expected_total.to_f
  end

  def click_order_button()
    click_button(@order_button)
  end
end
