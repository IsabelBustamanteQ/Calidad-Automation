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
  @gmo_home_page=GMOHomePage.new
end
Before '@AboutThisSite'do
  @about_page = AboutThisSitePage.new
end
Before '@Billing'do
  @billing_page = BillingPage.new
end
Before '@CatalogPage' do
  @expected_total = 0
  @selected_items = {}
  @catalog_page = OnlineCatalogPage.new
  @place_order_page = PlaceOrderPage.new
  page.driver.browser.manage.window.maximize
  visit('https://demo.borland.com/gmopost/online-catalog.htm')
end
After '@CatalogPage' do
  @catalog_page = nil
  @place_order_page = nil
  @expected_total = 0
  @selected_items = {}
end

def get_items_price
  {
    '3 Person Dome Tent' => 299.99,
    'External Frame Backpack' => 179.95,
    'Glacier Sun Glasses' => 67.99,
    'Padded Socks' => 19.99,
    'Hiking Boots' => 109.90,
    'Back Country Shorts' => 24.95
  }
end
