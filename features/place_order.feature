Feature: Place an order in the online catalog
  As a user
  I want to select items and quantities from the catalog
  So that I can place an order successfully

  Background:
    Given I am on the Google homepage
    And I visit GMO OnLine
    And I click the "Enter GMO OnLine" button
    Then I am on the online catalog homepage


  @maximaze
  Scenario Outline: Prevent zero quantities for each catalog item 
    When I select "<quantities_and_items_name>"
    And I click the "Place An Order" button
    Then I should see an alert with the message "Please Order Something First"

    Examples:
    | quantities_and_items_name  |
    | 0 3 Person Dome Tent       |
    | 0 Back Country Shorts      |
    | 0 External Frame Backpack  |
    | 0 Glacier Sun Glasses      |
    | 0 Hiking Boots             |
    | 0 Padded Socks             |
  

  @maximaze
  Scenario Outline: Prevent negative quantities for each catalog item
    When I select "<quantities_and_items_name>"
    And I click the "Place An Order" button
    Then I should see an alert with the message "Please enter only digits in this field."

    Examples:
    | quantities_and_items_name  |
    | -1 3 Person Dome Tent       |
    | -1 Back Country Shorts      |
    | -1 External Frame Backpack  |
    | -1 Glacier Sun Glasses      |
    | -1 Hiking Boots             |
    | -1 Padded Socks             |


  @maximaze
  Scenario Outline: Ordering items with specific quantities
    When I select "<quantities_and_items_name>"
    And I click the "Place An Order" button
    Then the selected items with their respective quantities should appear in the order summary
    And the total price should be calculated correctly
     
    Examples:
  | quantities_and_items_name              |
  | 1 3 Person Dome Tent                   |
  | 999 3 Person Dome Tent                 |
  | 1 Back Country Shorts                 |
  | 999 Back Country Shorts               |
  | 1 External Frame Backpack             |
  | 999 External Frame Backpack           |
  | 1 Glacier Sun Glasses                 |
  | 999 Glacier Sun Glasses               |
  | 1 Hiking Boots                        |
  | 999 Hiking Boots                      |
  | 1 Padded Socks                        |
  | 999 Padded Socks                      |
  | 1 3 Person Dome Tent, 1 Glacier Sun Glasses            |
  | 1 3 Person Dome Tent, 999 Glacier Sun Glasses          |
  | 999 3 Person Dome Tent, 1 Glacier Sun Glasses          |
  | 999 3 Person Dome Tent, 999 Glacier Sun Glasses        |
  | 1 Back Country Shorts, 1 Hiking Boots                 |
  | 999 Back Country Shorts, 999 Hiking Boots             |
  | 1 External Frame Backpack, 999 Padded Socks           |
  | 999 External Frame Backpack, 1 Padded Socks           |
  | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Back Country Shorts|
  | 999 3 Person Dome Tent, 1 Glacier Sun Glasses, 999 Back Country Shorts|
  | 1 3 Person Dome Tent, 999 Glacier Sun Glasses, 999 Back Country Shorts|
  | 999 3 Person Dome Tent, 999 Glacier Sun Glasses, 999 Back Country Shorts|
  | 1 External Frame Backpack, 1 Padded Socks, 1 Hiking Boots         |
  | 999 External Frame Backpack, 999 Padded Socks, 999 Hiking Boots   |
  | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Back Country Shorts, 1 Hiking Boots|
  | 999 3 Person Dome Tent, 999 Glacier Sun Glasses, 999 Back Country Shorts, 999 Hiking Boots|
  | 1 External Frame Backpack, 1 Padded Socks, 1 Glacier Sun Glasses, 1 Hiking Boots|
  | 999 External Frame Backpack, 999 Padded Socks, 999 Glacier Sun Glasses, 999 Hiking Boots|
  | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Back Country Shorts, 1 Hiking Boots, 1 Padded Socks|
  | 999 3 Person Dome Tent, 999 Glacier Sun Glasses, 999 Back Country Shorts, 999 Hiking Boots, 999 Padded Socks|
  | 1 External Frame Backpack, 1 Glacier Sun Glasses, 1 Back Country Shorts, 999 Hiking Boots, 999 Padded Socks|
  | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Back Country Shorts, 1 Hiking Boots, 1 Padded Socks, 1 External Frame Backpack|
  | 999 3 Person Dome Tent, 999 Glacier Sun Glasses, 999 Back Country Shorts, 999 Hiking Boots, 999 Padded Socks, 999 External Frame Backpack|




