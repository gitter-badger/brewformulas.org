Feature: Fetch formula list
  In order to show, search and look homebrew formulas
  As a robot
  I want to import the formulas from the Github repository
  So that I can update the database of available formulae

  Scenario: First execution should clone the repository
    Given no formula exist in homebrew
    And the Github homebrew repository is not clone yet
    And the Github homebrew repository has some formulae
    When the background task to get or update the formulae is executed
    Then the Github homebrew repository should be cloned
    And there should be some formulas in the database

  Scenario: Update existing repository without updates
    Given some formulas exist
    And the Github homebrew repository has been cloned
    And the Github homebrew repository doesn't have update
    When the background task to get or update the formulae is executed
    Then formulas should not been updated

  Scenario: Update existing repository with updated formula
    Given some formulas exist
    And the Github homebrew repository has been cloned
    And the Github homebrew repository has an updated formula
    When the background task to get or update the formulae is executed
    Then no new formula should be in the database
    And a formula should be updated

  Scenario: Update existing repository with new formula
    Given some formulas exist
    And the Github homebrew repository has been cloned
    And the Github homebrew repository has a new formula
    When the background task to get or update the formulae is executed
    Then a new formula should be available in the database
