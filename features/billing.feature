Feature: Billing Information View
  As a user
  I want to fill out the billing information form
  So that I can place an order

  Background:
    Given I am on the main catalog page
    When I add an item to the cart and place the order
    And I proceed with the order
    Then I should see the billing information page

  Scenario: Billing and shipping information are the same
  When I fill in the billing form with valid details
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
    | Expiration     | 12/94               |
  And I check the "Same as Bill To" checkbox
  And I submit the form
  Then I should see the order confirmation page

  Scenario: Billing and shipping information are different
  When I fill in the billing form with valid details
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
    | Expiration     | 12/97             |
  And I uncheck the "Same as Bill To" checkbox
  And I fill in the shipping form with valid details
    | Field          | Value               |
    | Name           | Jane Smith          |
    | Address        | 456 Elm St          |
    | City           | Shelbyville         |
    | State          | MO                  |
    | Zip            | 63019               |
    | Phone          | 555-987-6543        |
  And I submit the form
  Then I should see the order confirmation page