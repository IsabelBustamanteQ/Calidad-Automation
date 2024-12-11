Feature: Resetting the form in the online catalog
  As a user
  I want to reset all selected quantities in the catalog
  So that I can clear the form and start a new selection

  Background:
    Given I am on the online catalog homepage

  @CatalogPage
  Scenario Outline: Resetting items with specific quantities
    When I select the item "<Item>" and set the quantity to "<Quantity>"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

    Examples:
      | Quantity | Item                    |
      | 1        | 3 Person Dome Tent      |
      | 999      | 3 Person Dome Tent      |
      | 1        | Back Country Shorts     |
      | 999      | Back Country Shorts     |
      | 1        | Hiking Boots            |
      | 999      | Hiking Boots            |
      | 1        | Padded Socks            |
      | 999      | Padded Socks            |
      | 1        | Glacier Sun Glasses     |
      | 999      | Glacier Sun Glasses     |
      | 1        | External Frame Backpack |
      | 999      | External Frame Backpack |   


  @CatalogPage
  Scenario: Resetting quantities after selecting 2 items
    When I select the item "Back Country Shorts" and set the quantity to "10"
    And I select the item "Hiking Boots" and set the quantity to "5"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

  @CatalogPage
  Scenario: Resetting quantities after selecting 3 items
    When I select the item "Back Country Shorts" and set the quantity to "2"
    And I select the item "Hiking Boots" and set the quantity to "3"
    And I select the item "Padded Socks" and set the quantity to "6"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

  @CatalogPage
  Scenario: Resetting quantities after selecting 4 items
    When I select the item "Back Country Shorts" and set the quantity to "1"
    And I select the item "Hiking Boots" and set the quantity to "2"
    And I select the item "Padded Socks" and set the quantity to "3"
    And I select the item "Glacier Sun Glasses" and set the quantity to "1"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

  @CatalogPage
  Scenario: Resetting quantities after selecting 5 items
    When I select the item "Back Country Shorts" and set the quantity to "1"
    And I select the item "Hiking Boots" and set the quantity to "1"
    And I select the item "Padded Socks" and set the quantity to "4"
    And I select the item "Glacier Sun Glasses" and set the quantity to "2"
    And I select the item "External Frame Backpack" and set the quantity to "1"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

  @CatalogPage
  Scenario: Ordering all 6 items in the online catalog
    When I select the item "3 Person Dome Tent" and set the quantity to "1"
    And I select the item "Back Country Shorts" and set the quantity to "1"
    And I select the item "Hiking Boots" and set the quantity to "1"
    And I select the item "Padded Socks" and set the quantity to "2"
    And I select the item "Glacier Sun Glasses" and set the quantity to "2"
    And I select the item "External Frame Backpack" and set the quantity to "1"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"
