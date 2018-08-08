Feature: My Donations

  In order to be able to keep track of my donations
  As a User
  I should be able to keep a list of my donations

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: Listing my donations
    Given I have made donations
    When I visit the homepage
    Then I should see a list of my donations

  Scenario:
    When I create a new donations
    Then I should see my new donation in my donations

  Scenario: Changing the amount of a donation
   Given I have a donation in my donations
   When I change the amount of my donation
   Then I should see the donation with the new amount in my donations

  Scenario: Removing a donation from my donations
   Given I have a donation in my donations
   When I remove a donation from my donations
   Then I should not see it listing in my donations anymore