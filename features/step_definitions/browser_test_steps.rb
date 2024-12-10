# Then I see the Browser Test page
Then ("I see the Browser Test page") do 
    expect(@browser_page.on_browser_page?).to be true
  end
#   And I see a table showing the differences between browsers render
Then('I see a table showing the differences between browsers render') do
    expect(@browser_page.rows_have_information?).to be true
  end
#   And I see an element that moves with the message "Sometimes Even Left and Right Doesn't Mean Anything"
Then(/^I see an element that moves with the message "([^"]*)"$/) do |message|
    expect(@browser_page.has_marquee?).to eq(message.strip)
  end
