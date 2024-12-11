class OrderConfirmationPage
    include Capybara::DSL
  
    ORDER_CONFIRMATION_MESSAGE = 'Thank you for shopping with Green Mountain Outpost'
    
    BILL_TO_NAME = 'table tr:nth-child(1) td:nth-child(2) strong'
    BILL_TO_ADDRESS = 'table tr:nth-child(2) td:nth-child(2) strong'
    BILL_TO_CITY_STATE_ZIP = 'table tr:nth-child(3) td:nth-child(2) strong'
    
    SHIP_TO_NAME = 'table tr:nth-child(1) td:nth-child(5) strong'
    SHIP_TO_ADDRESS = 'table tr:nth-child(2) td:nth-child(5) strong'
    SHIP_TO_CITY_STATE_ZIP = 'table tr:nth-child(3) td:nth-child(5) strong'
    SHIP_TO_PHONE = 'table tr:nth-child(4) td:nth-child(5) strong'
    
    PAYMENT_METHOD = 'table tr:nth-child(7) td:nth-child(1)'
    
    def order_confirmation_present?
      page.has_content?(ORDER_CONFIRMATION_MESSAGE)
    end
  
    def get_billing_name
      find(BILL_TO_NAME).text.strip
    end
  
    def get_billing_address
      find(BILL_TO_ADDRESS).text.strip
    end
  
    def get_billing_city_state_zip
      find(BILL_TO_CITY_STATE_ZIP).text.strip
    end
  
    def get_shipping_name
      find(SHIP_TO_NAME).text.strip
    end
  
    def get_shipping_address
      find(SHIP_TO_ADDRESS).text.strip
    end
  
    def get_shipping_city_state_zip
      find(SHIP_TO_CITY_STATE_ZIP).text.strip
    end
  
    def get_shipping_phone
      find(SHIP_TO_PHONE).text.strip
    end
  
    def get_payment_method
      find(PAYMENT_METHOD).text.split(':').last.strip
    end
  
    def verify_billing_details(expected_details)
      expect(get_billing_name).to eq(expected_details['Name'])
      expect(get_billing_address).to eq(expected_details['Address'])
      expect(get_billing_city_state_zip).to eq("#{expected_details['City']}, #{expected_details['State']} #{expected_details['Zip']}")
    end
  
    def verify_shipping_details(expected_details)
      expect(get_shipping_name).to eq(expected_details['Name'])
      expect(get_shipping_address).to eq(expected_details['Address'])
      expect(get_shipping_city_state_zip).to eq("#{expected_details['City']}, #{expected_details['State']} #{expected_details['Zip']}")
      expect(get_shipping_phone).to eq(expected_details['Phone'])
    end
  end