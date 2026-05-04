*** Settings ***
Resource        ../Page/Purchase_page.robot

*** Keywords ***
User landed on home page
    Assert home page

User keen to view the score
    Click KOLmu aman
    Click saya tertarik

User enters voucher
    Click banner
    Input voucher
    Click submit voucher
    Click subscribe
    Click pay

User successfull purchase
    Assert purchase successfull

User click or refresh homepage
    Click KOLmu aman

User able to see the no hit result
    Assert no hit result