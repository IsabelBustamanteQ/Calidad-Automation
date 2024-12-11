Feature: Place an order in the online catalog
  As a user
  I want to select items and quantities from the catalog
  So that I can place an order successfully

  Background:
    Given I am on the GMO OnLine Page
    And I see a button that says "Enter GMO OnLine"
    And I will click "Enter GMO OnLine" button
    Then I am on the online catalog homepage
    And I see a table with products to buy

  @maximize @Catalog @HomePage
  Scenario Outline: Prevent zero quantities for any catalog item
    When I select the item "<Item>" and set the quantity to "<Quantity>"
    And I click the "Place An Order" button
    Then I should see an alert with the message "Please Order Something First"

    Examples:
      | Quantity | Item                    |
      | 0        | 3 Person Dome Tent      |
      | 0        | Back Country Shorts     |
      | 0        | External Frame Backpack |
      | 0        | Glacier Sun Glasses     |
      | 0        | Hiking Boots            |
      | 0        | Padded Socks            |

  @maximize @Catalog @HomePage
  Scenario Outline: Prevent invalid quantities for any catalog item
    When I select the item "<Item>" and set the quantity to "<Quantity>"
    And I click the "Place An Order" button
    Then I should see an alert with the message "Please enter only digits in this field."

    Examples:
      | Quantity | Item                    |
      | -1       | 3 Person Dome Tent      |
      | -1       | Back Country Shorts     |
      | -1       | External Frame Backpack |
      | -1       | Glacier Sun Glasses     |
      | -1       | Hiking Boots            |
      | -1       | Padded Socks            |
      | -999     | 3 Person Dome Tent      |
      | -999     | Back Country Shorts     |
      | -999     | External Frame Backpack |
      | -999     | Glacier Sun Glasses     |
      | -999     | Hiking Boots            |
      | -999     | Padded Socks            |
      | uno      | 3 Person Dome Tent      |
      | dos      | Back Country Shorts     |
      | tres     | External Frame Backpack |
      | cuatro   | Glacier Sun Glasses     |
      | cinco    | Hiking Boots            |
      | seis     | Padded Socks            |

  @maximize @Catalog @HomePage
  Scenario Outline: Ordering one item with variable quantities
    When I select the item "<Item>" and set the quantity to "<Quantity>"
    And I click the "Place An Order" button
    Then I should see the item "<Item>" with quantity "<Quantity>" in the order summary
    And the total price should be "<Total_Price>"

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

  @maximize @Catalog @HomePage
  Scenario: Ordering 2 items in the online catalog
    When I select the item "Back Country Shorts" and set the quantity to "10"
    And I select the item "Hiking Boots" and set the quantity to "5"
    And I click the "Place An Order" button
    Then I should see the item "Back Country Shorts" with quantity "10" in the order summary
    And I should see the item "Hiking Boots" with quantity "5" in the order summary
    And the total price should be "799"

  @maximize @Catalog @HomePage
  Scenario: Ordering 3 items in the online catalog
    When I select the item "Back Country Shorts" and set the quantity to "2"
    And I select the item "Hiking Boots" and set the quantity to "3"
    And I select the item "Padded Socks" and set the quantity to "6"
    And I click the "Place An Order" button
    Then I should see the item "Back Country Shorts" with quantity "2" in the order summary
    And I should see the item "Hiking Boots" with quantity "3" in the order summary
    And I should see the item "Padded Socks" with quantity "6" in the order summary
    And the total price should be "499.54"

  @maximize @Catalog @HomePage
  Scenario: Ordering 4 items in the online catalog
    When I select the item "Back Country Shorts" and set the quantity to "1"
    And I select the item "Hiking Boots" and set the quantity to "2"
    And I select the item "Padded Socks" and set the quantity to "3"
    And I select the item "Glacier Sun Glasses" and set the quantity to "1"
    And I click the "Place An Order" button
    Then I should see the item "Back Country Shorts" with quantity "1" in the order summary
    And I should see the item "Hiking Boots" with quantity "2" in the order summary
    And I should see the item "Padded Socks" with quantity "3" in the order summary
    And I should see the item "Glacier Sun Glasses" with quantity "1" in the order summary
    And the total price should be "372.71"

  @maximize @Catalog @HomePage
  Scenario: Ordering 5 items in the online catalog
    When I select the item "Back Country Shorts" and set the quantity to "1"
    And I select the item "Hiking Boots" and set the quantity to "1"
    And I select the item "Padded Socks" and set the quantity to "4"
    And I select the item "Glacier Sun Glasses" and set the quantity to "2"
    And I select the item "External Frame Backpack" and set the quantity to "1"
    And I click the "Place An Order" button
    Then I should see the item "Back Country Shorts" with quantity "1" in the order summary
    And I should see the item "Hiking Boots" with quantity "1" in the order summary
    And I should see the item "Padded Socks" with quantity "4" in the order summary
    And I should see the item "Glacier Sun Glasses" with quantity "2" in the order summary
    And I should see the item "External Frame Backpack" with quantity "1" in the order summary
    And the total price should be "530.74"

  @maximize @Catalog @HomePage
  Scenario: Ordering all 6 items in the online catalog
    When I select the item "3 Person Dome Tent" and set the quantity to "1"
    And I select the item "Back Country Shorts" and set the quantity to "1"
    And I select the item "Hiking Boots" and set the quantity to "1"
    And I select the item "Padded Socks" and set the quantity to "2"
    And I select the item "Glacier Sun Glasses" and set the quantity to "2"
    And I select the item "External Frame Backpack" and set the quantity to "1"
    And I click the "Place An Order" button
    Then I should see the item "3 Person Dome Tent" with quantity "1" in the order summary
    And I should see the item "Back Country Shorts" with quantity "1" in the order summary
    And I should see the item "Hiking Boots" with quantity "1" in the order summary
    And I should see the item "Padded Socks" with quantity "2" in the order summary
    And I should see the item "Glacier Sun Glasses" with quantity "2" in the order summary
    And I should see the item "External Frame Backpack" with quantity "1" in the order summary
    And the total price should be "790.75"