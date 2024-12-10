class GMOHomePage
    include Capybara::DSL
  
    def initialize
      @catalog_table_xpath = "/html/body/form/table/tbody/tr[2]/td/div/center/table"
    end
  
    def visit_google_homepage
      page.driver.browser.manage.window.maximize
      visit('/')
    end
  
    def visit_gmo_online
      visit('https://demo.borland.com/gmopost/')
    end
  
    def has_content?(content_message)
      page.has_content?(content_message)
    end
  
    def has_button?(button_message)
      page.has_button?(button_message)
    end
  
    def click_button_by_name(button_name)
      click_button(button_name)
    end
end