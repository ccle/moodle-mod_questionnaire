@mod @mod_questionnaire @ucla @core_edit @CCLE-3114
Feature: In a questionnaire, non-logged in guests can answer a questionnaire.
  In order to allow non-logged in users to answer a questionnaire
  As an administration
  I need to be able to override the guest role to allow submision.

  @javascript
  Scenario: Override the guest role to allow questionnaire submissions
    Given the following "courses" exist:
      | fullname | shortname |
      | Course 1 | C1 |
    And I log in as "admin"
    And I follow "Site home"
    And I follow "Course 1"
    And I navigate to "Enrolment methods" node in "Course administration > Users"
    And I click on "Enable" "link_or_button" in the "Guest access" "table_row"
    And I follow "C1"
    And I turn editing mode on
    And I add a "Questionnaire" to section "1" and I fill the form with:
      | Name | Public questionnaire |
    And I follow "Public questionnaire"
    And I follow "Add questions"
    And I set the field "id_type_id" to "Date"
    And I press "Add selected question type"
    And I set the following fields to these values:
      | Question Name | birthday |
      | Question Text | When is your birthday? |
    And I press "Save changes"
    When I navigate to "Permissions" node in "Course administration > Users"
    And I set the field "Advanced role override" to "Guest (0)"
    And I click on "Allow" "radio" in the "View a questionnaire" "table_row"
    And I click on "Allow" "radio" in the "Complete and submit a questionnaire" "table_row"
    And I press "Save changes"
    Then I log out
    And I follow "Course 1"
    And I press "Log in as a guest"
    And I should see "Public questionnaire"
    And I follow "Public questionnaire"
    And I should see "Answer the questions..."
    And I follow "Answer the questions..."
    And I should see "When is your birthday?"
    And I press "Submit questionnaire"
    And I should see "Thank you for completing this Questionnaire."