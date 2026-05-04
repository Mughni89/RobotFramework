*** Settings ***
Resource        ../Page/Login_page.robot

*** Keywords ***
User landed on landing page without permission notification
    Assert landing page

User fill email and password
    Fill email
    Fill password
    Click Login
    
    sleep  2s

User click KOLmu aman?
    Click check KOL
    Press Keycode    4