Feature: Billing Information View
  As a user
  I want to fill out the billing information form
  So that I can place an order

  Background:
    Given I am on the billing information page

  Scenario: Filling out the billing form with valid data
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
    | Expiration     | 12/2026             |
    And I submit the form
    Then I should see a confirmation message "Order placed successfully"
