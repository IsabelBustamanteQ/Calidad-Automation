Feature: As a internet user
         I want to enter to GMO OnLine
         so I test that it works correctly
@maximaze
Scenario: Visit GMOPost and see welcome text
  Given I am on the Google homepage
  When I visit GMO OnLine
  Then I see a text that says "Welcome to Green Mountain Outpost's OnLine Catalog!"
  And I see a button that says "Enter GMO OnLine"
  And I see a button that says "About The GMO Site"
  And I see a button that says "Browser Test Page"
@maximaze
Scenario: Visit GMOPost catalog
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Enter GMO OnLine" button
  Then I see a text that says "OnLine Catalog"
  And I see a table with products to buy
  
@maximaze
@GMOPage
Scenario Outline: See a product detail
  Given I am on GMO OnLine Catalog Page
  When I click on "<productName>"
  Then I see the Section "<sectionName>"
  And I see the Unit Price "<unitPrice>"
  And I see the Item Number "<itemNumber>"

  Examples:
    | productName             | sectionName | unitPrice  | itemNumber |
    | 3 Person Dome Tent      | tents       | $ 299.99   | 1000       |
    | External Frame Backpack | backpack    | $ 179.95   | 1001       |
    | Glacier Sun Glasses     | glasses     | $ 67.99    | 1002       |
    | Padded Socks            | socks       | $ 19.99    | 1003       |
    | Hiking Boots            | boots       | $ 109.90   | 1004       |
    | Back Country Shorts     | shorts      | $ 24.95    | 1005       |
    
