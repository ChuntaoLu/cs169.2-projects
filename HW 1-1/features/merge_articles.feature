Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple articles on the same topic
  I want to be able to merge similar articles

  Background:
    Given the blog of multiple users is set up
    And   Article "Hello" with id "3" body "Yo " exists
    And   Article "Hi" with id "4" body "World!" exists

  Scenario: A non-admin cannot merge two articles
    Given I am logged in as non-admin
    When  I follow "Articles"
    And   I follow "Hello"
    Then  I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article
        should contain the text of both previous articles
    Given I am logged into the admin panel
    When  I follow "Articles"
    And   I follow "Hello"
    Then  I should see "Merge Articles"
    When  I fill in "merge_with" with "4"
    And   I press "Merge"
    Then  I should see text "Yo World!"
