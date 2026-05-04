*** Settings ***
Resource        ../Page/Onboard_page.robot

*** Keywords ***
User open app
    No operation

User run on boarding page
    Swipe left
    Swipe left
    Click mulai

User landed on landing page
    Permission notification
    Assert landing page