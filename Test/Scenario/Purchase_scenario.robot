*** Settings ***
Resource        ../Step/Purchase_step.robot
Resource        ../../Resources/Android_config.robot

Test Teardown   Teardown test
Test Setup      Android_config.Open the Apps   

*** Test Cases ***
User successfull sign up
  Given User landed on home page
  When User keen to view the score
  And User enters voucher
  Then User successfull purchase