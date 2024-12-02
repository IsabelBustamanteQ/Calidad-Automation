Given('I am on the main catalog page') do
    visit 'https://demo.borland.com/gmopost/online-catalog.htm'
  end
  
  When('I add an item to the cart and place the order') do
    fill_in('QTY_SHORTS', with: 1) # Replace with the actual item you want to add
    click_button('Place An Order') # Button to submit the form
  end
  
  When('I proceed with the order') do
    click_button('Proceed With Order') # Button to proceed to the next page
  end
  
  Then('I should see the billing information page') do
    expect(page).to have_content('Billing Information') # Verify content specific to the billing page
  end