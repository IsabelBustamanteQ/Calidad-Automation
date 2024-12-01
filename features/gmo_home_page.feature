Feature: As a internet user
         I want to enter to GMO OnLine
         so I test that it works correctly

Scenario: Visit GMOPost and see welcome text
  Given I am on the Google homepage
  When I visit GMO OnLine
  Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
  And I see a button that says "Enter GMO OnLine"
  And I see a button that says "About The GMO Site"
  And I see a button that says "Browser Test Page"
  
Scenario: Visit GMOPost catalog
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Enter GMO OnLine" button
  Then I see a text that says "OnLine Catalog"
  And I see a table with products to buy

  
