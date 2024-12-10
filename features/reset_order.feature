Feature: Resetting the form in the online catalog
  As a user
  I want to reset all selected quantities in the catalog
  So that I can clear the form and start a new selection

  Background:
    Given I am on the online catalog homepage

  @CatalogPage
  Scenario Outline: Ordering items with specific quantities
    When I select the item "<Item>" and set the quantity to "<Quantity>"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

   Examples:
      | Quantity | Item                    |
      | 1        | 3 Person Dome Tent      |
      | 999      | 3 Person Dome Tent      |
      | 1        | Back Country Shorts     |

  @CatalogPage
  Scenario Outline: Resetting quantities after selecting items
    Given I am on the online catalog homepage
    When I select "<quantities_and_items_name>"
    And I click the "Reset Form" button
    Then all quantities should be reset to "0"

    Examples:
      | quantities_and_items_name                                                                                           |
      | 1 Glacier Sun Glasses, 2 3 Person Dome Tent, 1 Hiking Boots, 2 Back Country Shorts, 3 External Frame Backpack, 5 Padded Socks |
      | 999 Glacier Sun Glasses, 999 3 Person Dome Tent, 999 Hiking Boots, 999 Back Country Shorts, 999 External Frame Backpack, 5 Padded Socks |
      | 1 3 Person Dome Tent, 2 External Frame Backpack, 3 Glacier Sun Glasses, 2 Padded Socks, 1 Hiking Boots             |
      | 2 3 Person Dome Tent, 3 External Frame Backpack, 1 Glacier Sun Glasses, 2 Padded Socks, 3 Back Country Shorts      |
      | 3 3 Person Dome Tent, 1 External Frame Backpack, 2 Hiking Boots, 1 Glacier Sun Glasses, 2 Back Country Shorts      |
      | 1 3 Person Dome Tent, 1 External Frame Backpack, 3 Glacier Sun Glasses, 999 Padded Socks, 1 Hiking Boots             |
      | 2 External Frame Backpack, 999 Hiking Boots, 3 Back Country Shorts, 2 Glacier Sun Glasses, 1 Padded Socks            |
      | 999 3 Person Dome Tent, 2 Glacier Sun Glasses, 1 Padded Socks, 3 Hiking Boots, 2 External Frame Backpack             |
      | 2 3 Person Dome Tent, 3 Glacier Sun Glasses, 1 Hiking Boots, 999 External Frame Backpack, 1 Back Country Shorts      |
