#   When I click on "<productName>"
When(/^I click on "([^"]*)"$/) do |productName|
    @catalog_page.click_link(productName)
    @product_page = ProductsPage.new(productName)
  end
#   Then I see the Section "<sectionName>"
  Then(/^I see the Section "([^"]*)"$/) do |sectionName|
    result = @product_page.see_section?(sectionName)
    expect(result[:url_contains_section]).to be true
    expect(result[:section_text_matches]).to be true
    expect(result[:element_visible]).to be true
  end
#   And I see the Unit Price "<unitPrice>"
  Then('I see the Unit Price {string}') do |unitPrice|
    expect(@product_page.get_unit_price).to eq(unitPrice.strip)
  end
  #   And I see the Item Number "<itemNumber>"  
  Then('I see the Item Number {string}') do |itemNumber|
    expect(@product_page.get_item_number).to eq(itemNumber.strip)
  end
  