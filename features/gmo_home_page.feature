Feature: As a internet user
         I want to enter to GMO OnLine
         so I test that it works correctly

Scenario: Visit GMOPost and see welcome text
  Given I am on the Google homepage
  When I visit "https://demo.borland.com/gmopost/"
  Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
  
