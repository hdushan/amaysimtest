Feature: Modify Settings

  @login_before_and_logout_after
  Scenario: Save Call Forwarding Number
    Given I am on the Settings page
    When I disable call forwarding
    Then I see the call forwarding disabled in my settings
  
  @login_before_and_logout_after
  Scenario: Clear Call Forwarding Number
    Given I am on the Settings page
    And I initially disable call forwarding
    When I enable call forwarding to "CALLFORWARDINGNUMBER"
    Then I see the "CALLFORWARDINGNUMBER" saved in my settings