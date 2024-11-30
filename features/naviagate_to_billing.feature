Feature: Navigate to the billing page

  Scenario: Successfully navigate to the billing page
    Given I am on the main catalog page
    When I add an item to the cart and place the order
    And I proceed with the order
    Then I should see the billing information page