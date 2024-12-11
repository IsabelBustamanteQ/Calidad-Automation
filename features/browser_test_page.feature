Feature: As a internet user
         I want to enter to Browser Test Page
         so I can compare how different browsers render web content
         
@maximize @HomePage @BrowserTestPage
Scenario: Visit GMOPost Browser Test Page
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "Browser Test Page" button
  Then I see the Browser Test page
  And I see a table showing the differences between browsers render
  And I see an element that moves with the message "Sometimes Even Left and Right Doesn't Mean Anything"
