*** Settings ***
Library    AppiumLibrary  WITH NAME  Mobile
Library    String

*** Variables ***
${landingPage}                  com.kbij.skorku:id/tvWelcome
${createAccount}                com.kbij.skorku:id/btnSignIn
${userName}                     com.kbij.skorku:id/et_name
${userEmail}                    com.kbij.skorku:id/et_email
${userPhone}                    com.kbij.skorku:id/et_phone
${userPassword}                 com.kbij.skorku:id/et_password
${userConfirmPassword}          com.kbij.skorku:id/et_confirm_password
${submitForm}                   com.kbij.skorku:id/btn_verify_otp
${scrollDown}                   com.kbij.skorku:id/btnScrollDown
${checkedAgreement}             com.kbij.skorku:id/cbxAgreement
${next}                         com.kbij.skorku:id/btnContinue
${createPin}                    com.kbij.skorku:id/btnContinue
${accountCreated}               com.kbij.skorku:id/btnContinue
${goHomepage}                   com.kbij.skorku:id/skipText
${hoever}                       com.kbij.skorku:id/btnNext
${hoeverDone}                   com.kbij.skorku:id/btnDone

*** Keywords ***

Assert landing page
    Mobile.Wait Until Element Is Visible          ${landingPage}

Click create account
    Mobile.Click element                          ${createAccount}

Fill name
    [Arguments]                            ${full_name}
    Mobile.Wait Until Element Is Visible          ${userName}
    Mobile.Input text                             ${userName}  ${full_name}

Fill email
    [Arguments]                            ${email} 
    Mobile.Input Text                             ${userEmail}  ${email}  

Fill phone
    [Arguments]                            ${phone}
    Mobile.Input Text                             ${userPhone}  ${phone}  

Fill password 
    Mobile.Input Text                             ${userPassword}  test@123

Fill confirm password
    Mobile.Input Text                             ${userConfirmPassword}  test@123

Click submit form
    Mobile.Click element                          ${submitForm}

Scroll down
    Mobile.Wait Until Element Is Visible          ${scrollDown}
    Mobile.Click element                          ${scrollDown}

Checked tnc
    Mobile.Click Element                          ${checkedAgreement}

Click next
    Mobile.Click Element                          ${next}

Create pin
    Mobile.Wait Until Element Is Visible          ${createPin}
    Mobile.Click Element                          ${createPin}

Input pin
    [Arguments]    ${pin}
    ${pin}=        Convert To String    ${pin}
    ${length}=     Get Length           ${pin}

    FOR    ${index}    IN RANGE    ${length}
        ${digit}=      Get Substring    ${pin}    ${index}    ${index + 1}
        Mobile.Wait Until Element Is Visible    id=com.kbij.skorku:id/btn${digit}    5s
        Mobile.Click Element                    id=com.kbij.skorku:id/btn${digit}
    END

Input pin confirmation
    [Arguments]    ${pin}
    ${pin}=        Convert To String    ${pin}
    ${length}=     Get Length           ${pin}

    FOR    ${index}    IN RANGE    ${length}
        ${digit}=      Get Substring    ${pin}    ${index}    ${index + 1}
        Mobile.Wait Until Element Is Visible    id=com.kbij.skorku:id/btn${digit}    5s
        Mobile.Click Element                    id=com.kbij.skorku:id/btn${digit}
    END

Assert account created
    Mobile.Wait Until Element Is Visible          ${accountCreated}
    Mobile.Click Element                          ${accountCreated}

Skip to homepage
    Mobile.Wait Until Element Is Visible          ${goHomepage}
    Mobile.Click Element                          ${goHomepage}

Click hoever
    Mobile.Wait Until Element Is Visible          ${hoever}
    Mobile.Click Element                          ${hoever}
    Mobile.Click Element                          ${hoever}
    Mobile.Click Element                          ${hoeverDone}