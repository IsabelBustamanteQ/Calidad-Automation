After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

Before '@GMOPage' do
  page.driver.browser.manage.window.maximize
  visit('https://demo.borland.com/gmopost/')
  expect(page).to have_button('Enter GMO OnLine')
end

Before do
  @expected_total = 0
  @selected_items = {}
end