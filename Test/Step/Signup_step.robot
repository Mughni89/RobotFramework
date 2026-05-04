*** Settings ***
Resource        ../Page/Signup_page.robot
Resource        ../../Resources/database.robot
Resource        ../../Resources/generate_user.robot
Resource        ../../Resources/getOtpFromEmail.robot

*** Keywords ***
 User landed on landing page without permission notification
    Assert landing page

User fill registration form
    ${full_name}    ${email}    ${phone}   ${nik}=    Generate Registration Data
    Click create account
    Fill name                                  ${full_name}
    Fill email                                 ${email}
    Fill phone                                 ${phone}
    Fill password
    Fill confirm password
    Click submit form
    RETURN  ${email}  ${nik}

User agreed term and condition
    Scroll down
    Checked tnc
    Click next
    Scroll Down
    Checked tnc
    Click next    

# User input otp
#     [Arguments]  ${email}
#     Connect to postgres
#     ${otp}=    Wait Until Keyword Succeeds  
#     ...    8x
#     ...    3s
#     ...    Get Latest OTP From DB
#     ...    ${email}
#     ${Length}=  Get Length  ${otp}

#     FOR    ${index}    IN RANGE    ${length}
#         ${position}=    Evaluate    ${index} + 1
#         ${locator}=     Set Variable    id=com.kbij.skorku:id/pin${position}

#         Log    Inputting digit ${otp}[${index}] into ${locator}

#         Wait Until Element Is Visible    ${locator}    5s
#         Click Element    ${locator}
#         Clear Text       ${locator}
#         Input Text       ${locator}    ${otp}[${index}]
#     END
    
User create pin
    Create pin
    Input pin  ${pin}
    Input pin confirmation  ${pin}

User successfull register
    Assert account created
    Skip to homepage
    # click hoever 

User get otp from email
    [Arguments]    ${email}
    # ${_}  ${email}  ${_}=    Generate Registration Data
    # Log    Generated Email: ${email}
    Log    Registration Email: ${email}
    Open Website
    Open Inbox With Email    ${email}
    ${otp}=    Get OTP From Email
    Log    OTP Code: ${otp}