*** Settings ***
Library  AppiumLibrary  WITH NAME  Mobile

*** Variables ***
${homePage}                     android=new UiSelector().className("android.view.ViewGroup").instance(3)
${kolmuAman}                    com.kbij.skorku:id/btnCheck
${userKeen}                     com.kbij.skorku:id/btnContinue
${banner}                       com.kbij.skorku:id/ivBanner
${voucher}                      com.kbij.skorku:id/inputEditText
${submitVoucher}                com.kbij.skorku:id/btnSave
${subscribe}                    com.kbij.skorku:id/btnContinue
${pay}                          com.kbij.skorku:id/btnContinue
${purchaseSuccess}              com.kbij.skorku:id/agreementLayout
${noHitResult}                  com.kbij.skorku:id/tvTitleNoHit

*** Keywords ***

Assert home page
    Wait Until Page Contains Element  ${homePage}  10s

Click KOLmu aman
    Mobile.Wait Until Element Is Visible  ${kolmuAman}  10s 
    Mobile.Click Element  ${kolmuAman}  

Click saya tertarik
    Mobile.Wait Until Element Is Visible  ${userKeen}  10s 
    Mobile.Click Element  ${userKeen}

Click banner
    Mobile.Click Element  ${banner}

Input voucher
    Mobile.Wait Until Element Is Visible  ${voucher}  10s
    Mobile.Input Text  ${voucher}  JWOM3BYZ

Click submit voucher
    Mobile.Click Element  ${submitVoucher}

Click subscribe
    Mobile.Click Element  ${subscribe}

Click pay
    Mobile.Click Element  ${pay}

Assert purchase successfull
    Mobile.Wait Until Element Is Visible  ${purchaseSuccess}

Swipe left
    Swipe By Percent     80   50   20  50

Assert no hit result
    Mobile.Wait Until Element Is Visible  ${noHitResult}  40s