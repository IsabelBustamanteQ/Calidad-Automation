Feature: Navigate to the billing page
  As a user
  I want to navigate to the billing information page
  So that I can place an order

  Background:
    Given I am on the GMO OnLine Page
    And I see a button that says "Enter GMO OnLine"
    And I will click "Enter GMO OnLine" button
    Then I am on the online catalog homepage
    And I see a table with products to buy

  @maximize
  @Catalog @HomePage @Billing
  Scenario: Successfully navigate to the billing page
    When I select the item "Back Country Shorts" and set the quantity to "1"
    And I click the "Place An Order" button
    And I click the Proceed With Order button
    Then I should see the billing information page