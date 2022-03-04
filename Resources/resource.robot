*** Settings ***
Documentation     A resource file with reusable resources.
Library           SeleniumLibrary
Resource          ../Locators/locators.robot
Library          ../Custom_Library/credential_generator.py
Library          ../Custom_Library/transaction_fee_calculator.py
Resource          ../Locators/locators.robot
Resource          ../Keywords/keywords.robot

*** Variables ***
${SERVER}         anylogi-recruitment.web.app
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    https://${SERVER}/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    React App

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_TEXTBOX}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_TEXTBOX}    ${password}

Register Credentials
    Click Button    ${SIGNUP_BTN}

Submit Credentials
    Click Button    ${LOGIN_BTN}


Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    React App


Click on SignUp Button
    Click Button    ${SIGNUP_BTN}

Verify blank username error message
    [Arguments]    ${BLANK_USERNAME_ERR_MSG}
    ${error_msg}=   Get Text    ${ERROR_MSG_SPAN}
    Should Be Equal     ${error_msg}    ${BLANK_USERNAME_ERR_MSG}

Verify whitespaces username error message
    [Arguments]    ${WHITESPACES_USERNAME_ERR_MSG}
    ${error_msg}=   Get Text    ${ERROR_MSG_SPAN}
    Should Be Equal     ${error_msg}    ${WHITESPACES_USERNAME_ERR_MSG}

Verify less than 8 characters password error message
    [Arguments]    ${LESS_THAN_8_CHAR_PASSWORD_ERR_MSG}
    ${error_msg}=   Get Text    ${ERROR_MSG_SPAN}
    Should Be Equal     ${error_msg}    ${LESS_THAN_8_CHAR_PASSWORD_ERR_MSG}

Verify larger than 32 characters password error message
    [Arguments]    ${MORE_THAN_32_CHAR_PASSWORD_ERR_MSG}
    ${error_msg}=   Get Text    ${ERROR_MSG_SPAN}
    Should Be Equal     ${error_msg}    ${MORE_THAN_32_CHAR_PASSWORD_ERR_MSG}

Verify Password must contain numbers error message
    [Arguments]    ${WITHOUT_NUMBER_PASSWORD_ERR_MSG}
    ${error_msg}=   Get Text    ${ERROR_MSG_SPAN}
    Should Be Equal     ${error_msg}    ${WITHOUT_NUMBER_PASSWORD_ERR_MSG}

Verify Password must contain uppercase letters error message
    [Arguments]    ${WITHOUT_UPPERCASE_PASSWORD_ERR_MSG}
    ${error_msg}=   Get Text    ${ERROR_MSG_SPAN}
    Should Be Equal     ${error_msg}    ${WITHOUT_UPPERCASE_PASSWORD_ERR_MSG}

Generate random password
    [Arguments]     ${letters_count}    ${digits_count}
    ${pass}=    get random password     ${letters_count}    ${digits_count}
    [Return]      ${pass}

Generate random username
    [Arguments]     ${length}
    ${username}=    get random username     ${length}
    [Return]      ${username}

clicks on withdraw link
    Wait Until Element Is Visible       ${WITHDRAW}
    Click Link       ${WITHDRAW}

clicks on deposit link
    Wait Until Element Is Visible       ${DEPOSIT}
    Click Link       ${DEPOSIT}

Verify transaction fee is 30% of the intended withdrawal amount
    [Arguments]    ${transaction_amount}
    Wait Until Element Is Visible       ${CURRENT_BALANCE}
    ${current_bal}=   Get Text    ${CURRENT_BALANCE}
    Wait Until Element Is Visible       ${TRANSACTION_AMOUNT_TEXTBOX}
    Input Text    ${TRANSACTION_AMOUNT_TEXTBOX}    ${transaction_amount}
    ${calculated_transaction_fees}=   Get Text    ${CALCULATED_TRANSACTION_FEES}
    ${calculated_transaction_fees_by_function}=     calculate30PercentTransaction      ${transaction_amount}
    Should Be Equal     ${calculated_transaction_fees_by_function}      ${calculated_transaction_fees}
    ${after_transaction_final_withdrawal_key_from_UI}=   Get Text    ${AFTER_TRANSACTION_FINAL_WITHDRAWAL_KEY}
    ${after_transaction_final_withdrawal_key_from_function}=     after transaction final withdrawal key      ${transaction_amount}
    Should Be Equal     ${after_transaction_final_withdrawal_key_from_function}      ${after_transaction_final_withdrawal_key_from_UI}


Verify transaction fee is 30% of the intended deposit amount
    [Arguments]    ${transaction_amount}
    Wait Until Element Is Visible       ${CURRENT_BALANCE}
    ${current_bal}=   Get Text    ${CURRENT_BALANCE}
    Wait Until Element Is Visible       ${TRANSACTION_AMOUNT_TEXTBOX}
    Input Text    ${TRANSACTION_AMOUNT_TEXTBOX}    ${transaction_amount}
    ${calculated_transaction_fees}=   Get Text    ${CALCULATED_TRANSACTION_FEES}
    ${calculated_transaction_fees_by_function}=     calculate30PercentTransaction      ${transaction_amount}
    Should Be Equal     ${calculated_transaction_fees_by_function}      ${calculated_transaction_fees}
    ${after_transaction_final_deposit_key_from_UI}=   Get Text    ${AFTER_TRANSACTION_FINAL_DEPOSIT_KEY}
    ${after_transaction_final_deposit_key_from_function}=     after transaction final deposit key      ${transaction_amount}
    Should Be Equal     ${after_transaction_final_deposit_key_from_UI}      ${after_transaction_final_deposit_key_from_function}

Make transaction and verify if Account balance update in every 10 seconds
    [Arguments]    ${transaction_amount}
    Wait Until Element Is Visible       ${CURRENT_BALANCE}
    ${current_bal}=   Get Text    ${CURRENT_BALANCE}
    Wait Until Element Is Visible       ${TRANSACTION_AMOUNT_TEXTBOX}
    Input Text    ${TRANSACTION_AMOUNT_TEXTBOX}    ${transaction_amount}
    Click Button    ${DEPOSIT_BTN}
    ${current_account_balance_by_function}=     get account balance after deposite   ${current_bal}    ${transaction_amount}
    sleep       10s
    ${current_account_balance_by_UI}=     Get Text    ${ACCOUNT_CURRENT_BALANCE}
    Should Be Equal     ${current_account_balance_by_function}      ${current_account_balance_by_UI}