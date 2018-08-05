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
