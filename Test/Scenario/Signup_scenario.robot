*** Settings ***
Resource        ../Step/Signup_step.robot
Resource        ../Step/Purchase_step.robot
Resource        ../Step/Kyc_step.robot
Resource        ../../Resources/Android_config.robot

Test Teardown   Teardown test
Test Setup      Android_config.Open the Apps   

*** Test Cases ***
User successfull sign up
  Given User landed on landing page without permission notification
  ${email}  ${nik}=  When User fill registration form
  And User agreed term and condition
  ${otp}=  And User get otp from email  ${email}
  And User create pin 
  Then User successfull register

  When User keen to view the score
  And User enters voucher
  Then User successfull purchase

  When User hardcode the ekyc  ${email}  ${nik}
  And User click or refresh homepage
  Then User able to see the no hit result
