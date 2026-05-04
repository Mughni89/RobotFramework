*** Settings ***
Resource        ../Step/Onboard_step.robot
Resource        ../../Resources/Android_config.robot

Test Setup      Open the Apps
Test Teardown   Teardown test   

*** Test Cases ***
User passed on boarding
  Given User open app
  When User run on boarding page
  Then User landed on landing page