*** Settings ***
Documentation     A Locators file with reusable locators.


*** Variables ***
${SIGNUP_BTN}         //*[contains(text(),'SIGNUP')]
${LOGIN_BTN}         //*[contains(text(),'LOGIN')]
${DEPOSIT_BTN}         //*[contains(text(),'Deposit')]
${USERNAME_TEXTBOX}         //input[1]
${PASSWORD_TEXTBOX}         //input[2]
${ERROR_MSG_SPAN}         //span

${WITHDRAW}         //*[contains(text(),'引き出す')]
#${WITHDRAW}         //*[@id="root"]/div/div/div/div/h2/a[2]
${DEPOSIT}         //*[contains(text(),'デポジット')]

#${CURRENT_BALANCE}         .//*[contains(text(),'残高')]//following::span[1]
${CURRENT_BALANCE}         //*[@id="root"]/div/div/div/span[2]
#${WITHDRAW_AMOUNT_TEXTBOX}         .//input
${TRANSACTION_AMOUNT_TEXTBOX}         //*[@id="root"]/div/div/div/input
${CALCULATED_TRANSACTION_FEES}         //*[@id="root"]/div/div/div/span[4]
${AFTER_TRANSACTION_FINAL_WITHDRAWAL_KEY}         //*[@id="root"]/div/div/div/span[6]
${AFTER_TRANSACTION_FINAL_DEPOSIT_KEY}         //*[@id="root"]/div/div/div/span[6]
${ACCOUNT_CURRENT_BALANCE}         //*[@id="root"]/div/div/div/div/table/tbody/tr[1]/td[2]






${VALID_PASSWORD}       Testtestte1
${WITHOUT_NUMBER_PASSWORD}       Testtestte
${WITHOUT_UPPERCASE_PASSWORD}       testtestte1
${LESS_THAN_8_CHAR_PASSWORD}       Asdasd
${MORE_THAN_32_CHAR_PASSWORD}       Testtesttesttesttesttesttesttesttest
${VALID_USERNAME}       Test
${BLANK_USERNAME}
${BLANK_USERNAME_ERR_MSG}         User name cannot be blank
${WHITESPACES_USERNAME_ERR_MSG}         User name cannot contain whitespaces
${LESS_THAN_8_CHAR_PASSWORD_ERR_MSG}         Password cannot be less than 8 characters
${MORE_THAN_32_CHAR_PASSWORD_ERR_MSG}         Password cannot be longer than 32 characters
${WITHOUT_NUMBER_PASSWORD_ERR_MSG}         Password must contain numbers
${WITHOUT_UPPERCASE_PASSWORD_ERR_MSG}         Password must contain uppercase letters
${transaction_amount}        1000