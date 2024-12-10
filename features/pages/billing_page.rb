class BillingPage
    include Capybara::DSL
  
    # Billing Form Fields
    BILLING_NAME = 'billName'
    BILLING_ADDRESS = 'billAddress'
    BILLING_CITY = 'billCity'
    BILLING_STATE = 'billState'
    BILLING_ZIP = 'billZipCode'
    BILLING_PHONE = 'billPhone'
    BILLING_EMAIL = 'billEmail'
    CARD_TYPE = 'CardType'
    CARD_NUMBER = 'CardNumber'
    CARD_EXPIRATION = 'CardDate'
  
    # Shipping Form Fields
    SHIPPING_SAME_AS_BILL_CHECKBOX = 'shipSameAsBill'
    SHIPPING_NAME = 'shipName'
    SHIPPING_ADDRESS = 'shipAddress'
    SHIPPING_CITY = 'shipCity'
    SHIPPING_STATE = 'shipState'
    SHIPPING_ZIP = 'shipZipCode'
    SHIPPING_PHONE = 'shipPhone'
  
    # Submit Button
    SUBMIT_BUTTON = 'bSubmit'
  
    def visit_page
      visit 'https://demo.borland.com/gmopost/'
    end
  
    def fill_billing_form(billing_data)
      fill_in BILLING_NAME, with: billing_data['Name']
      fill_in BILLING_ADDRESS, with: billing_data['Address']
      fill_in BILLING_CITY, with: billing_data['City']
      fill_in BILLING_STATE, with: billing_data['State']
      fill_in BILLING_ZIP, with: billing_data['Zip']
      fill_in BILLING_PHONE, with: billing_data['Phone']
      fill_in BILLING_EMAIL, with: billing_data['E-mail']
      select billing_data['Card Type'], from: CARD_TYPE
      fill_in CARD_NUMBER, with: billing_data['Card Number']
      fill_in CARD_EXPIRATION, with: billing_data['Expiration']
    end
  
    def fill_shipping_form(shipping_data)
      fill_in SHIPPING_NAME, with: shipping_data['Name']
      fill_in SHIPPING_ADDRESS, with: shipping_data['Address']
      fill_in SHIPPING_CITY, with: shipping_data['City']
      fill_in SHIPPING_STATE, with: shipping_data['State']
      fill_in SHIPPING_ZIP, with: shipping_data['Zip']
      fill_in SHIPPING_PHONE, with: shipping_data['Phone']
    end
  
    def check_same_as_bill_to
      check SHIPPING_SAME_AS_BILL_CHECKBOX
    end
  
    def uncheck_same_as_bill_to
      uncheck SHIPPING_SAME_AS_BILL_CHECKBOX
    end
  
    def submit_form
      click_button SUBMIT_BUTTON
    end
  
    def leave_shipping_form_empty
      fill_in SHIPPING_NAME, with: ''
      fill_in SHIPPING_ADDRESS, with: ''
      fill_in SHIPPING_CITY, with: ''
      fill_in SHIPPING_STATE, with: ''
      fill_in SHIPPING_ZIP, with: ''
      fill_in SHIPPING_PHONE, with: ''
    end
  
    def get_alert_text
      alert = page.driver.browser.switch_to.alert
      alert_text = alert.text
      alert.accept
      alert_text
    end
  
    def valid_email_format?(email)
      email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      email_regex.match?(email)
    end
  
    def order_confirmation_present?
      page.has_content?('Thank you for shopping with Green Mountain Outpost')
    end
  end