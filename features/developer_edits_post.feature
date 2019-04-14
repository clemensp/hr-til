Feature: Developer edits post

  Scenario: Developer edits post
    Given I am a signed in developer
    And I have a post
    And I visit the homepage
    When I click edit
    Then I see the edit page for that post
    When I enter new information into that form
    And I click submit
    Then I see the show page for that edited post
    And I see a message "Post updated"

  Scenario: Developer can't edit other developer's posts via url
    Given I am a signed in developer
    And a post exists by another developer
    When I visit the edit page for that post
    Then I see an error message "You can only edit your own posts"

  Scenario: Developer can't edit other developer's posts via edit button
    Given I am a signed in developer
    And a post exists by another developer
    When I visit the homepage
    Then I do not see the edit button

  Scenario: Developer edits post with invalid data
    Given I am a signed in developer
    And I have a post
    And I visit the homepage
    When I click edit
    Then I see the edit page for that post
    When I edit the post to no longer have a body
    And I click submit
    Then I see an error message "can't be blank"

  Scenario: Developer clicks cancel
    Given I am a signed in developer
    And I have a post
    And I visit the homepage
    When I click edit
    Then I see the edit page for that post
    When I click cancel
    Then I see the homepage
    And I see my unedited post

  @javascript
  Scenario: Developer edits post with a markdown preview
    Given I am a signed in developer
    And I have a post with markdown
    And I visit the homepage
    When I click edit
    Then I see the edit page for my markdown post
    And I see a markdown preview of my post
    When I enter information with markdown inline code into that form
    Then I see a markdown preview with my rendered code

  Scenario: Developer mangles url
    Given I am a signed in developer
    And I have a post
    And I visit the homepage
    When I click edit
    Then I see the edit page for that post
    When I visit a mangled version of the edit url
    Then I see the edit page for that post
