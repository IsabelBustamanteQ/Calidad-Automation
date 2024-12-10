class OnlineCatalogPage
  include Capybara::DSL

  def initialize
    @catalog_table_xpath = "/html/body/form/table/tbody/tr[2]/td/div/center/table"
    @place_order_button = "Place An Order"
    @reset_form_button = "Reset Form"
  end

  def on_catalog_page?
    has_content?("OnLine Catalog") && has_button?(@place_order_button) && has_button?(@reset_form_button) 
  end

  def catalog_rows
    find(:xpath, @catalog_table_xpath).all(:xpath, "tbody/tr")
  end

  def has_products?
    @has_items = true
    catalog_table = find(:xpath, @catalog_table_xpath)
    catalog_rows.each_with_index do |row, index|
      if index > 0
        if row.find(:xpath, "td[2]/a/strong").text == ""
          @has_items = false
        end
      end
    end
    @has_items
  end

  def find_row_by_item_name(item_name)
    catalog_rows.each_with_index do |row, index|
      next if index.zero? 
      return row if row.find(:xpath, "td[2]/a/strong").text.strip == item_name
    end
    nil
  end

  def select_item_quantity(item_name, quantity)
    row = find_row_by_item_name(item_name)
    raise "Item not found: #{item_name}" unless row

    price_text = row.find(:xpath, "td[3]").text
    price_unit = price_text.gsub('$', '').strip.to_f

    quantity_input = row.find(:xpath, "td[4]/h1/input")
    quantity_input.set(quantity)

    { item_name: item_name, quantity: quantity.to_i, price_unit: price_unit }
  end

  def click_button_by_text(button_text)
    click_button(button_text)
  end

  def all_quantities_reset_to?(value)
    all('input[type="text"]').all? { |field| field.value == value.to_s }
  end

  def get_total_price(selected_items)
    items_with_prices = get_items_price()
    total_price = 0
    selected_items.each do |item_name, quantity|
      total_price += items_with_prices[item_name] * quantity
    end
    total_price.round(2)
  end

  def verify_alert_message(expected_message)
    alert = page.driver.browser.switch_to.alert
    alert.text == expected_message
  end
  def click_on_product(product_name)
    click_link(product_name)
  end
end
