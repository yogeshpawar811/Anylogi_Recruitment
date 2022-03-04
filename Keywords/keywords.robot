*** Settings ***
Documentation     A Keyword file with reusable keywords.
Library           SeleniumLibrary
Resource          ../Locators/locators.robot
Resource          ../Resources/resource.robot

*** Keywords ***

Browser is opened to login page
    Open browser to login page

User clicks on SignUp button
    Click on SignUp Button

User enters blank value in username and try to signup
    Input username    ${BLANK_USERNAME}
    Input password    ${VALID_PASSWORD}
    Register Credentials

User enters whitespaces in username and try to signup
    Input username    ${SPACE}
    Input password    ${VALID_PASSWORD}
    Register Credentials

User enters username and larger than 32 characters password try to signup
    Input username    ${VALID_USERNAME}
    Input password    ${MORE_THAN_32_CHAR_PASSWORD}
    Register Credentials

User enters username and without number password and try to signup
    Input username    ${VALID_USERNAME}
    Input password    ${WITHOUT_NUMBER_PASSWORD}
    Register Credentials

User enters username and without uppercase password and try to signup
    Input username    ${VALID_USERNAME}
    Input password    ${WITHOUT_UPPERCASE_PASSWORD}
    Register Credentials

User enters correct formatted username and password and try to Submit
    ${random_username}=   Generate random username      6
    ${random_pass}=   Generate random password      4     5
    Input username    ${random_username}
    Input password    ${random_pass}
    Register Credentials

User enters username and less than 8 characters password try to signup
    Input username    ${VALID_USERNAME}
    Input password    ${LESS_THAN_8_CHAR_PASSWORD}
    Register Credentials

Error message should be verified as blank username error message
    Verify blank username error message     ${BLANK_USERNAME_ERR_MSG}

Error message should be verified as whitespaces username error message
    Verify whitespaces username error message     ${WHITESPACES_USERNAME_ERR_MSG}

Error message should be verified as less than 8 characters password error message
    Verify less than 8 characters password error message     ${LESS_THAN_8_CHAR_PASSWORD_ERR_MSG}

Error message should be verified as larger than 32 characters password error message
    Verify larger than 32 characters password error message     ${MORE_THAN_32_CHAR_PASSWORD_ERR_MSG}

Error message should be verified as Password must contain numbers error message
    Verify Password must contain numbers error message     ${WITHOUT_NUMBER_PASSWORD_ERR_MSG}

Error message should be verified as Password must contain uppercase letters error message
    Verify Password must contain uppercase letters error message     ${WITHOUT_UPPERCASE_PASSWORD_ERR_MSG}

User clicks on withdraw link
    clicks on withdraw link

User clicks on deposit link
    clicks on deposit link

User able to see transaction fee is 30% of the intended withdrawal amount
    Verify transaction fee is 30% of the intended withdrawal amount     ${transaction_amount}

User able to see transaction fee is 30% of the intended deposit amount
    Verify transaction fee is 30% of the intended deposit amount     ${transaction_amount}

User makes transaction and verify if Account balance update in every 10 seconds
    Make transaction and verify if Account balance update in every 10 seconds     ${transaction_amount}