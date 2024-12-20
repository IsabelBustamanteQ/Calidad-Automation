After do 
    Capybara.current_session.driver.quit
    @catalog_page = nil
    @place_order_page = nil
    @expected_total = 0
    @selected_items = {}
    @gmo_home_page = nil
    @about_page = nil
    @browser_page = nil
    @order_confirmation_page = nil
    @billing_page = nil
end
Before '@maximize' do
  page.driver.browser.manage.window.maximize
end
Before '@HomePage' do
  visit('https://demo.borland.com/gmopost/')
  @gmo_home_page=GMOHomePage.new
end
Before '@AboutThisSite'do
  @about_page = AboutThisSitePage.new
end
Before '@BrowserTestPage'do
  @browser_page = BrowserTestPage.new
end
Before '@Confirmation' do
  @order_confirmation_page = OrderConfirmationPage.new
end
Before '@Billing'do
  @billing_page = BillingPage.new
end
Before '@Catalog' do
  @expected_total = 0
  @selected_items = {}
  @catalog_page = OnlineCatalogPage.new
  @place_order_page = PlaceOrderPage.new
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
