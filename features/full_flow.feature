Feature: As a internet user
         I want to enter to GMO OnLine
         so I can place an order
@maximaze
Scenario Outline: Place an order
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Enter GMO OnLine" button
  And I see a text that says "OnLine Catalog"
  And I select "<quantities_and_items_name>"
  And I click the "Place An Order" button
  And the selected items with their respective quantities should appear in the order summary
  And the total price should be calculated correctly
  And I click the "Proceed With Order" button
  And I see a text that says "Billing Information"
  And I fill in the billing form with valid details
    | Field          | Value               |
    | Name           | John Doe            |
    | Address        | 123 Main St         |
    | City           | Springfield         |
    | State          | IL                  |
    | Zip            | 62704               |
    | Phone          | 555-123-4567        |
    | E-mail         | john@example.com    |
    | Card Type      | Visa                |
    | Card Number    | 4111111111111111    |
    | Expiration     | 12/99               |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  Then I should see the order confirmation page
  And I see a button that says "Return to Home Page"   
    Examples:
    | quantities_and_items_name                                                          |
    | 1 Back Country Shorts                                                              |
    | 1 Hiking Boots, 1 Glacier Sun Glasses, 1 External Frame Backpack, 1 Back Country Shorts |
    | 3 Hiking Boots, 2 External Frame Backpack, 1 Glacier Sun Glasses, 3 Padded Socks    |
    | 1 3 Person Dome Tent, 1 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots |
    | 1 3 Person Dome Tent, 2 Glacier Sun Glasses, 3 Hiking Boots, 2 Padded Socks         |
    | 100 3 Person Dome Tent, 200 Hiking Boots, 1000 Glacier Sun Glasses                  |
    

@maximaze
Scenario Outline: Place an order and Return to Home Page
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Enter GMO OnLine" button
  And I see a text that says "OnLine Catalog"
  And I select "<quantities_and_items_name>"
  And I click the "Place An Order" button
  And the selected items with their respective quantities should appear in the order summary
  And the total price should be calculated correctly
  And I click the "Proceed With Order" button
  And I see a text that says "Billing Information"
  And I fill in the billing form with valid details
    | Field          | Value               |
    | Name           | John Doe            |
    | Address        | 123 Main St         |
    | City           | Springfield         |
    | State          | IL                  |
    | Zip            | 62704               |
    | Phone          | 555-123-4567        |
    | E-mail         | john@example.com    |
    | Card Type      | Visa                |
    | Card Number    | 4111111111111111    |
    | Expiration     | 12/99               |
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button
  And I should see the order confirmation page
  And I click the "Return to Home Page" button
  Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
  And I see a button that says "Enter GMO OnLine"
  And I see a button that says "About The GMO Site"
  And I see a button that says "Browser Test Page"
  Examples:
    | quantities_and_items_name                                                          |
    | 1 Back Country Shorts                                                              |
    | 2 Glacier Sun Glasses, 3 Back Country Shorts                                        |
    | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Hiking Boots                          |
    | 1 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots                     |
    | 3 3 Person Dome Tent, 2 External Frame Backpack, 1 Padded Socks                      |
    | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Back Country Shorts, 2 Hiking Boots   |
    | 1 3 Person Dome Tent, 1 External Frame Backpack, 3 Glacier Sun Glasses               |
    | 3 Hiking Boots, 2 Glacier Sun Glasses, 1 Padded Socks                               |
    
