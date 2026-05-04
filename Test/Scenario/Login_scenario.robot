*** Settings ***
Resource        ../Step/Login_step.robot
Resource        ../Step/Kyc_step.robot
Resource        ../../Resources/Android_config.robot

Test Teardown   Teardown test
Test Setup      Android_config.Open the Apps   

*** Test Cases ***
User successfull log in
  Given User landed on landing page without permission notification
  When User fill email and password
  And User click KOLmu aman?