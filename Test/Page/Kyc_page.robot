*** Settings ***
Library  AppiumLibrary  WITH NAME  Mobile

*** Variables ***
${startKyc}                     com.kbij.skorku:id/btnContinue
${captureKtp}                   com.kbij.skorku:id/btnContinue

*** Keywords ***

Click start kyc
    Mobile.Click element                ${startKyc}  

Click take ktp picture
    Wait Until Keyword Succeeds    15s    1s    Mobile.Click Element    ${captureKtp}