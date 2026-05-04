*** Settings ***
Library  AppiumLibrary  WITH NAME  Mobile
Library  RequestsLibrary
Library  OperatingSystem

*** Variables ***
${landingPage}                  com.kbij.skorku:id/tvWelcome
${emailField}                   com.kbij.skorku:id/et_email
${passwordField}                com.kbij.skorku:id/et_password
${loginButton}                  com.kbij.skorku:id/btnLogin
${nameUser}                     com.kbij.skorku:id/tvName
${checkKOLButton}               com.kbij.skorku:id/btnCheck
${homeFront}                    com.kbij.skorku:id/lay1

*** Keywords ***

Assert landing page
    Mobile.Wait Until Element Is Visible  ${landingPage}

Fill email 
    Mobile.Input Text  ${emailField}  silvia.sirait.161657@yopmail.com

fill password 
    Mobile.Input Text  ${passwordField}  test@123

Click Login
    Mobile.Click Element  ${loginButton}

Click check KOL
    Mobile.Wait Until Element Is Visible  ${homeFront}
    Mobile.Click Element  ${checkKOLButton}