Feature: Billing Information View
  As a user
  I want to fill out the billing information form
  So that I can place an order

  Background:
    Given I am on the main catalog page
    When I add an item to the cart and place the order
    And I proceed with the order
    Then I should see the billing information page
    
  @maximize
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
    | Expiration     | 12/99               |
  And I check the "Same as Bill To" checkbox
  And I submit the form
  Then I should see the order confirmation page

  @maximize
  @onlyThis
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
  Then I should see the order confirmation page with different billing and shipping data

  @maximize
  Scenario: Credit card expiration date is invalid
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
    | Expiration     | 12/00               |
  And I check the "Same as Bill To" checkbox
  And I submit the form
  Then I should see an alert with the text "Please enter a valid date of the form 'MM/YY' in this field."

  @maximize
  Scenario: Billing form has missing required fields
    When I fill in the billing form with invalid details
      | Field          | Value               |
      | Name           |                     |
      | Address        |                     |
      | City           |                     |
      | State          |                     |
      | Zip            |                     |
      | Phone          |                     |
      | E-mail         |                     |
      | Card Type      | Visa                |
      | Card Number    | 4111111111111111    |
      | Expiration     | 12/97               |
    And I submit the form
    Then I should see an alert with the text "This is a required field."

  @maximize
  Scenario: "Same as Bill To" checkbox is not checked and shipping form is empty
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
      | Expiration     | 12/97               |
    And I uncheck the "Same as Bill To" checkbox
    And I leave the shipping form empty
    And I submit the form
    Then I should see an alert with the text "This is a required field."

  @maximize
  Scenario: "Same as Bill To" checkbox is not checked and shipping form is empty
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
      | Expiration     | 12/97               |
    And I uncheck the "Same as Bill To" checkbox
    And I leave the shipping form empty
    And I submit the form
    Then I should see an alert with the text "This is a required field."

  @maximize
  Scenario: Billing form contains invalid email format
    When I fill in the billing form with invalid details
      | Field          | Value               |
      | Name           | John Doe            |
      | Address        | 123 Main St         |
      | City           | Springfield         |
      | State          | IL                  |
      | Zip            | 62704               |
      | Phone          | 555-123-4567        |
      | E-mail         | john@example        |
      | Card Type      | Visa                |
      | Card Number    | 4111111111111111    |
      | Expiration     | 12/97               |
    And I check the "Same as Bill To" checkbox
    And I submit the form
    Then I should see an alert with the text "Invalid email format. Please enter a valid email."

  @maximize
  Scenario: Successful submission with edge-case data
    When I fill in the billing form with edge-case details
      | Field          | Value                     |
      | Name           | Maximilianus-Alexandros   |
      | Address        | 789 Longname Lane Apt #7  |
      | City           | New Springfield           |
      | State          | WY                        |
      | Zip            | 82001                     |
      | Phone          | 555-123-4567              |
      | E-mail         | unique.email@rare.coop    |
      | Card Type      | Visa                      |
      | Card Number    | 4111111111111111          |
      | Expiration     | 01/28                     |
    And I check the "Same as Bill To" checkbox
    And I submit the form
    Then I should see the order confirmation page

  @maximize
  Scenario: Invalid phone number format
    When I fill in the billing form with invalid phone number
      | Field          | Value               |
      | Phone          | 555123             |
    And I submit the form
    Then I should see an alert with the text "This is a required field."

  @maximize
  Scenario: Invalid phone number length
    When I fill in the billing form with invalid phone number
      | Field          | Value               |
      | Phone          | 555-123-4567890123 |
    And I submit the form
    Then I should see an alert with the text "This is a required field."

  @maximize
  Scenario: Missing mandatory billing details
    When I fill in the billing form without providing mandatory fields
      | Field          | Value               |
      | Name           |                     |
      | Address        |                     |
    And I submit the form
    Then I should see an alert with the text "This is a required field."

  @maximize
  Scenario: Billing form contains an invalid ZIP code
    When I fill in the billing form with invalid details
      | Field          | Value               |
      | Name           | John Doe            |
      | Address        | 123 Main St         |
      | City           | Springfield         |
      | State          | IL                  |
      | Zip            | 62ABC               |
      | Phone          | 555-123-4567        |
      | E-mail         | john@example.com    |
      | Card Type      | Visa                |
      | Card Number    | 4111111111111111    |
      | Expiration     | 12/97               |
    And I check the "Same as Bill To" checkbox
    And I submit the form
    Then I should see an alert with the text "Please enter a valid zip code in this field."