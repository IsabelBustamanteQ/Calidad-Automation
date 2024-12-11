Feature: As a internet user
         I want to enter to About the GMO Site
         so I can see more information about GMO Online Site
@maximize @HomePage @AboutThisSite
Scenario: Visit GMOPost About This Site Page
  Given I am on the Google homepage
  When I visit GMO OnLine
  And I will click "About The GMO Site" button
  Then I see the About The GMO Site
  And I see a warning that says "DO NOT ENTER REAL BILLING OR SHIPPING INFORMATION"
  And I see a table with the technologies used by this site
  
