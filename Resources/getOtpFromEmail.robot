*** Settings ***
Library    SeleniumLibrary  WITH NAME  Web
Resource   ${EXECDIR}/Resources/generate_user.robot
Library    AppiumLibrary  WITH NAME  Mobile

*** Variables ***
${URL}            https://yopmail.com/
${BROWSER}        chrome
${EMAIL_FIELD}    id=login
${CHECK_BTN}      id=refreshbut

*** Keywords ***
Open Website
    Web.Open Browser        ${URL}    ${BROWSER}
    Web.Maximize Browser Window

Open Inbox With Email
    [Arguments]    ${email}
    Web.Input Text    ${EMAIL_FIELD}    ${email}
    Web.Click Element    ${CHECK_BTN}
    Sleep  10s

Get OTP From Email
    Web.Wait Until Element Is Visible    id=ifmail    20s
    Web.Select Frame    id=ifmail

    ${email_body}=    Web.Get Text    xpath=//body
    Log    ${email_body}

    ${otp}=    Evaluate    __import__('re').search(r'\\d{6}', """${email_body}""").group()
    ${length}=  Get Length  ${otp}

    FOR    ${index}    IN RANGE    ${length}
        ${position}=    Evaluate    ${index} + 1
        ${locator}=     Set Variable    id=com.kbij.skorku:id/pin${position}

        Log    Inputting digit ${otp}[${index}] into ${locator}

        Mobile.Wait Until Element Is Visible    ${locator}    5s
        Mobile.Click Element    ${locator} 
        # Clear Text       ${locator}
        Mobile.Input Text       ${locator}    ${otp}[${index}]
    END