Feature: Place an order in the online catalog
  As a user
  I want to select items and quantities from the catalog
  So that I can place an order successfully


  Background:
    Given I am on the online catalog homepage

  Scenario Outline: Ordering items with specific quantities
    When I select "<quantities_and_items_name>"
    And I click the "Place An Order" button
    Then the selected items with their respective quantities should appear in the order summary
    And the total price should be calculated correctly
     
 
    Examples:
    | quantities_and_items_name                                                          |
    | 1 3 Person Dome Tent                                                                |
    | 1 Back Country Shorts                                                             |
    | 1 External Frame Backpack, 2 Hiking Boots                                           |
    | 2 Glacier Sun Glasses, 3 Back Country Shorts                                        |
    | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Hiking Boots                          |
    | 1 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots                     |
    | 3 3 Person Dome Tent, 2 External Frame Backpack, 1 Padded Socks                      |
    | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Back Country Shorts, 2 Hiking Boots   |
    | 1 3 Person Dome Tent, 1 External Frame Backpack, 3 Glacier Sun Glasses               |
    | 3 Hiking Boots, 2 Glacier Sun Glasses, 1 Padded Socks                               |
    | 1 External Frame Backpack, 3 Glacier Sun Glasses, 2 Hiking Boots                     |
    | 1 3 Person Dome Tent, 2 Glacier Sun Glasses, 1 Hiking Boots, 3 Back Country Shorts  |
    | 100 3 Person Dome Tent, 1000 External Frame Backpack, 200 Glacier Sun Glasses       |
    | 1 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 External Frame Backpack, 1 Padded Socks |
    | 2 3 Person Dome Tent, 1 External Frame Backpack, 3 Hiking Boots, 1 Glacier Sun Glasses |
    | 1 3 Person Dome Tent, 2 External Frame Backpack, 2 Glacier Sun Glasses, 3 Hiking Boots |
    | 1000 Hiking Boots, 200 Glacier Sun Glasses, 50 Back Country Shorts                  |
    | 1 Glacier Sun Glasses, 1 External Frame Backpack, 3 Hiking Boots, 2 Padded Socks    |
    | 2 3 Person Dome Tent, 2 External Frame Backpack, 1 Glacier Sun Glasses, 3 Hiking Boots |
    | 3 3 Person Dome Tent, 2 Hiking Boots, 1 Glacier Sun Glasses, 1 Padded Socks          |
    | 1 Hiking Boots, 1 Glacier Sun Glasses, 1 External Frame Backpack, 1 Back Country Shorts |
    | 3 Hiking Boots, 2 External Frame Backpack, 1 Glacier Sun Glasses, 3 Padded Socks    |
    | 1 3 Person Dome Tent, 1 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots |
    | 1 3 Person Dome Tent, 2 Glacier Sun Glasses, 3 Hiking Boots, 2 Padded Socks         |
    | 100 3 Person Dome Tent, 200 Hiking Boots, 1000 Glacier Sun Glasses                  |
    | 3 3 Person Dome Tent, 1 Hiking Boots, 2 Glacier Sun Glasses, 3 Padded Socks          |
    | 2 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Hiking Boots, 1 Back Country Shorts   |
    | 1 3 Person Dome Tent, 2 Hiking Boots, 3 Glacier Sun Glasses, 1 Padded Socks          |
    | 100 3 Person Dome Tent, 1000 Back Country Shorts, 500 Hiking Boots, 100 Glacier Sun Glasses |
    | 2 Glacier Sun Glasses, 3 Hiking Boots, 1 External Frame Backpack, 1 Padded Socks    |
    | 1 Hiking Boots, 3 Glacier Sun Glasses, 2 3 Person Dome Tent, 1 Back Country Shorts  |
    | 1 Glacier Sun Glasses, 1 External Frame Backpack, 1 Padded Socks, 2 Hiking Boots    |
    | 2 3 Person Dome Tent, 3 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots |
    | 1 External Frame Backpack, 3 3 Person Dome Tent, 1 Glacier Sun Glasses, 3 Hiking Boots |
    | 1 Glacier Sun Glasses, 2 Hiking Boots, 3 External Frame Backpack, 1 Padded Socks    |
    | 1 3 Person Dome Tent, 2 Back Country Shorts, 3 Glacier Sun Glasses                    |
    | 3 Glacier Sun Glasses, 2 Hiking Boots, 1 External Frame Backpack                     |
    | 1 External Frame Backpack, 3 Hiking Boots, 1 Glacier Sun Glasses, 2 Back Country Shorts |
    | 1 3 Person Dome Tent, 2 External Frame Backpack, 3 Glacier Sun Glasses, 2 Padded Socks, 1 Hiking Boots |
    | 2 3 Person Dome Tent, 3 External Frame Backpack, 1 Glacier Sun Glasses, 2 Padded Socks, 3 Back Country Shorts |
    | 3 3 Person Dome Tent, 1 External Frame Backpack, 2 Hiking Boots, 1 Glacier Sun Glasses, 2 Back Country Shorts |
    | 1 3 Person Dome Tent, 1 External Frame Backpack, 3 Glacier Sun Glasses, 2 Padded Socks, 1 Hiking Boots |
    | 2 External Frame Backpack, 1 Hiking Boots, 3 Back Country Shorts, 2 Glacier Sun Glasses, 1 Padded Socks |
    | 1 3 Person Dome Tent, 2 Glacier Sun Glasses, 1 Padded Socks, 3 Hiking Boots, 2 External Frame Backpack |
    | 2 3 Person Dome Tent, 3 Glacier Sun Glasses, 1 Hiking Boots, 2 External Frame Backpack, 1 Back Country Shorts |
    | 1 External Frame Backpack, 3 Glacier Sun Glasses, 2 Padded Socks, 3 Hiking Boots, 1 Back Country Shorts |
    | 1 3 Person Dome Tent, 2 Hiking Boots, 3 Glacier Sun Glasses, 1 External Frame Backpack, 2 Padded Socks |
    | 3 3 Person Dome Tent, 2 Hiking Boots, 1 Glacier Sun Glasses, 2 External Frame Backpack, 1 Back Country Shorts |
    | 1 3 Person Dome Tent, 2 External Frame Backpack, 3 Glacier Sun Glasses, 2 Hiking Boots, 1 Padded Socks |
    | 1 Glacier Sun Glasses, 2 Hiking Boots, 1 External Frame Backpack, 3 Back Country Shorts, 2 Padded Socks |
    | 3 3 Person Dome Tent, 1 Hiking Boots, 2 Glacier Sun Glasses, 1 Back Country Shorts, 2 Padded Socks |
    | 2 3 Person Dome Tent, 1 External Frame Backpack, 3 Hiking Boots, 2 Glacier Sun Glasses, 1 Back Country Shorts |
    | 1 3 Person Dome Tent, 3 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots, 2 Padded Socks |
    | 2 3 Person Dome Tent, 1 Hiking Boots, 3 Glacier Sun Glasses, 2 External Frame Backpack, 1 Padded Socks |
    | 1 Glacier Sun Glasses, 2 3 Person Dome Tent, 3 Hiking Boots, 1 External Frame Backpack, 2 Back Country Shorts |
    | 3 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots, 2 Padded Socks, 1 Back Country Shorts |
    | 2 3 Person Dome Tent, 1 Hiking Boots, 1 Glacier Sun Glasses, 2 Padded Socks, 3 Back Country Shorts |
    | 3 3 Person Dome Tent, 2 Hiking Boots, 1 Glacier Sun Glasses, 3 External Frame Backpack, 2 Back Country Shorts |
    | 2 3 Person Dome Tent, 1 Glacier Sun Glasses, 1 Hiking Boots, 3 Back Country Shorts, 2 External Frame Backpack |
    | 3 Hiking Boots, 2 Glacier Sun Glasses, 1 3 Person Dome Tent, 1 Back Country Shorts, 2 Padded Socks |
    | 1 3 Person Dome Tent, 2 Hiking Boots, 3 Glacier Sun Glasses, 1 External Frame Backpack, 1 Back Country Shorts |
    | 1 3 Person Dome Tent, 2 Glacier Sun Glasses, 1 Hiking Boots, 3 Back Country Shorts, 2 External Frame Backpack |
    | 2 External Frame Backpack, 3 Glacier Sun Glasses, 1 Hiking Boots, 2 3 Person Dome Tent, 1 Padded Socks |
    | 3 Hiking Boots, 2 Glacier Sun Glasses, 1 External Frame Backpack, 2 Back Country Shorts, 1 Padded Socks |
    | 1 Glacier Sun Glasses, 3 3 Person Dome Tent, 1 External Frame Backpack, 2 Hiking Boots, 3 Back Country Shorts |
    | 2 3 Person Dome Tent, 1 External Frame Backpack, 3 Glacier Sun Glasses, 2 Hiking Boots, 1 Padded Socks |
    | 2 External Frame Backpack, 3 3 Person Dome Tent, 1 Hiking Boots, 2 Glacier Sun Glasses, 1 Back Country Shorts |
    | 1 Glacier Sun Glasses, 3 Hiking Boots, 2 Padded Socks, 1 3 Person Dome Tent, 2 Back Country Shorts |
    | 1 3 Person Dome Tent, 2 External Frame Backpack, 1 Glacier Sun Glasses, 2 Hiking Boots, 3 Back Country Shorts |
    | 3 3 Person Dome Tent, 2 Hiking Boots, 1 Glacier Sun Glasses, 1 External Frame Backpack, 2 Back Country Shorts |
    | 2 External Frame Backpack, 1 Glacier Sun Glasses, 3 Hiking Boots, 2 Padded Socks, 1 Back Country Shorts |
    | 1 Glacier Sun Glasses, 2 3 Person Dome Tent, 1 Hiking Boots, 2 Back Country Shorts, 3 External Frame Backpack |
    | 1 Glacier Sun Glasses, 2 3 Person Dome Tent, 1 Hiking Boots, 2 Back Country Shorts, 3 External Frame Backpack, 5 Padded Socks|



