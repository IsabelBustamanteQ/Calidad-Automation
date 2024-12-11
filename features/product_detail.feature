Feature: As a internet user
         I want to enter to an Specific product
         so I can see more information and details about it  
@maximize
@HomePage @Catalog
Scenario Outline: See a product detail
  Given I am on the GMO OnLine Page
  And I see a button that says "Enter GMO OnLine"
  And I will click "Enter GMO OnLine" button
  Then I am on the online catalog homepage
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
    
