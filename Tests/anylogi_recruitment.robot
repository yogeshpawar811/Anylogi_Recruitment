*** Settings ***
Documentation     A test suite with a Gherkin style test.
...               This test is functionally identical for Anylogi Recruitment
Resource          ../Locators/locators.robot
Resource          ../Resources/resource.robot
Test Teardown     Close Browser


*** Test Cases ***
SignUp Validation on Blank UserName
    [Tags]    SignUp_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters blank value in username and try to signup
    Then Error message should be verified as blank username error message

SignUp Validation on UserName as Whitespaces
    [Tags]    SignUp_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters whitespaces in username and try to signup
    Then Error message should be verified as whitespaces username error message

SignUp Validation on Password cannot be less than 8 characters (< 8)
    [Tags]    SignUp_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters username and less than 8 characters password try to signup
    Then Error message should be verified as less than 8 characters password error message

SignUp Validation on Password cannot be larger than 32 characters (> 32)
    [Tags]    SignUp_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters username and larger than 32 characters password try to signup
    Then Error message should be verified as larger than 32 characters password error message

SignUp Validation on Password must contain numbers
    [Tags]    SignUp_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters username and without number password and try to signup
    Then Error message should be verified as Password must contain numbers error message

SignUp Validation on Password must contain uppercase letters
    [Tags]    SignUp_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters username and without uppercase password and try to signup
    Then Error message should be verified as Password must contain uppercase letters error message


User should be able to withdraw money
    [Tags]    Withdraw_Money_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters correct formatted username and password and try to Submit
    And User clicks on withdraw link
    Then User able to see transaction fee is 30% of the intended withdrawal amount

User should be able to deposit money
    [Tags]    Deposit_Money_Validation
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters correct formatted username and password and try to Submit
    And User clicks on deposit link
    Then User able to see transaction fee is 30% of the intended deposit amount

Account balance should update every 10 seconds
    [Tags]    Account_Balance_Update_Verificaion
    Given browser is opened to login page
    Then welcome page should be open
    And User clicks on SignUp button
    When User enters correct formatted username and password and try to Submit
    And User clicks on deposit link
    Then User makes transaction and verify if Account balance update in every 10 seconds
