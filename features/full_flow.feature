Feature: As a internet user
         I want to enter to GMO OnLine
         so I can place an order

@maximize @HomePage @Catalog @Billing @Confirmation
Scenario Outline: Place an order
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Enter GMO OnLine" button
  And I am on the online catalog homepage
  And I select the item "<Item>" and set the quantity to "<Quantity>"
  And I click the "Place An Order" button
  And I should see the item "<Item>" with quantity "<Quantity>" in the order summary
  And the total price should be "<Total_Price>"
  And I click the Proceed With Order button
  Then I should see the billing information page
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
  And I submit the form
  Then I should see the order confirmation page
  And I see a button that says "Return to Home Page"
   Examples:
      | Quantity | Item                    | Total_Price   |
      | 1        | 3 Person Dome Tent      | 299.99        |
      | 999      | 3 Person Dome Tent      | 299690.01     |
      | 1        | Back Country Shorts     | 24.95         |
      | 999      | Back Country Shorts     | 24925.05      |
      | 1        | Hiking Boots            | 109.90        |
      | 999      | Hiking Boots            | 109790.1      |
      | 1        | Padded Socks            | 19.99         |
      | 999      | Padded Socks            | 19970.01      |
      | 1        | Glacier Sun Glasses     | 67.99         |
      | 999      | Glacier Sun Glasses     | 67922.01      |
      | 1        | External Frame Backpack | 179.95        |
      | 999      | External Frame Backpack | 179770.05     | 
    

@maximize @HomePage @Catalog @Billing @Confirmation
Scenario Outline: Place an order and Return to Home Page
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Enter GMO OnLine" button
  And I am on the online catalog homepage
  And I select the item "<Item>" and set the quantity to "<Quantity>"
  And I click the "Place An Order" button
  And I should see the item "<Item>" with quantity "<Quantity>" in the order summary
  And the total price should be "<Total_Price>"
  And I click the Proceed With Order button
  Then I should see the billing information page
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
  And I submit the form
  Then I should see the order confirmation page
  And I click the "Return to Home Page" button
  Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
  And I see a button that says "Enter GMO OnLine"
  And I see a button that says "About The GMO Site"
  And I see a button that says "Browser Test Page"
  Examples:
Examples:
      | Quantity | Item                    | Total_Price   |
      | 1        | 3 Person Dome Tent      | 299.99        |
      | 999      | 3 Person Dome Tent      | 299690.01     |
      | 1        | Back Country Shorts     | 24.95         |
      | 999      | Back Country Shorts     | 24925.05      |
      | 1        | Hiking Boots            | 109.90        |
      | 999      | Hiking Boots            | 109790.1      |
      | 1        | Padded Socks            | 19.99         |
      | 999      | Padded Socks            | 19970.01      |
      | 1        | Glacier Sun Glasses     | 67.99         |
      | 999      | Glacier Sun Glasses     | 67922.01      |
      | 1        | External Frame Backpack | 179.95        |
      | 999      | External Frame Backpack | 179770.05     | 