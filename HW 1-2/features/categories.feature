Feature: categories
  As a blog administrator
  In order to avoid categorize articles
  I want to be able to create or edit article categories

  Background:
    Given the blog is set up
    And   I am logged into the admin panel

  Scenario: view and edit categories
    Given I am on the admin content page
    When  I follow "Categories"
    Then  I should be on the Categories page
