Feature: Navigate to the billing page
  As a user
  I want to navigate to the billing information page
  So that I can place an order
  
  Scenario: Successfully navigate to the billing page
    Given I am on the main catalog page
    When I add an item to the cart and place the order
    And I proceed with the order
    Then I should see the billing information page