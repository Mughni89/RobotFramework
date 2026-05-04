*** Settings ***
Library    AppiumLibrary

*** Variables ***
${onBoardPage}                  com.kbij.skorku:id/imageOnboarding
${letsStart}                    com.kbij.skorku:id/buttonStart
${notifPermission}              com.android.permissioncontroller:id/grant_dialog
${allowNotif}                   com.android.permissioncontroller:id/permission_allow_button
${landingPage}                  com.kbij.skorku:id/tvWelcome

*** Keywords ***

Swipe left 
    Wait Until Element Is Visible   ${onBoardPage}
    Swipe By Percent     80   50   20  50

Click mulai
    Click Element   ${letsStart}

Permission notification
    Wait Until Element Is Visible  ${notifPermission}
    Click Element                  ${allowNotif}

Assert landing page
    Wait Until Element Is Visible  ${landingPage}