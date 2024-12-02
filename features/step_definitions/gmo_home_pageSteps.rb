
#   When I visit https://demo.borland.com/gmopost/
When('I visit GMO OnLine') do
  visit('https://demo.borland.com/gmopost/')
end
# Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
Then(/^I see a text that says "([^"]*)"$/) do |contentMessage|
  expect(page).to have_content(contentMessage)
end
  # And I see a button that says "Enter GMO OnLine"
Then (/^I see a button that says "([^"]*)"$/) do |buttonMessage|
  expect(page).to have_button(buttonMessage)
end
# And I will click "Enter GMO OnLine" button
When(/^I will click "([^"]*)" button$/) do |enterButton|
  click_button(enterButton)
end
# And I see a table with products to buy
Then('I see a table with products to buy') do
  address = find(:xpath, '/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[2]/td[2]/a')
  
  if address.text != "3 Person Dome Tent"
    raise "Product not found"
  end
end

# Given I am on GMO OnLine Catalog Page
Given ('I am on GMO OnLine Catalog Page') do
  click_button('Enter GMO OnLine')
end
  # When I click on "<productName>"
When(/^I click on "([^"]*)"$/) do |productName|
    click_link(productName)
    @product=productName
    case @product
    when '3 Person Dome Tent'
      @tableposition = 0
    when 'External Frame Backpack'
      @tableposition = 10
    when 'Glacier Sun Glasses'
      @tableposition = 20
    when 'Padded Socks'
      @tableposition = 30
    when 'Hiking Boots'
      @tableposition = 40
    when 'Back Country Shorts'
      @tableposition = 50
      
    end

end
  #  Then I see the Section "<sectionName>"
Then (/^I see the Section "([^"]*)"$/) do |sectionName|
  expect(current_url).to include("##{sectionName.downcase}")
  @currentposition=@tableposition+3
  element = find("body > h2:nth-child(#{@currentposition})")
  expect(element.text.strip).to eq(@product)
  expect(element).to be_visible, "El elemento no está visible en la pantalla actual."
end 

 #  And I see the Unit Price	"<unitPrice>"
 Then('I see the Unit Price {string}') do |unitPrice|
  @currentposition=@tableposition+5
  element = find("body > div:nth-child(#{@currentposition}) > table > tbody > tr:nth-child(1) > td:nth-child(3)")
  expect(element.text.strip).to eq(unitPrice.strip)
end
# And I see the Item Number "<itemNumber>"
Then('I see the Item Number {string}') do |itemNumber|
  @currentposition=@tableposition+5
  element = find("body > div:nth-child(#{@currentposition}) > table > tbody > tr:nth-child(3) > td:nth-child(2)")
  expect(element.text.strip).to eq(itemNumber.strip)
end