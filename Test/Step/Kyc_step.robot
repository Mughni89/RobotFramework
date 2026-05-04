*** Settings ***
Resource        ../Page/Kyc_page.robot
Library         Process
Resource        ../../Resources/database.robot
Resource        ../../Resources/generate_user.robot

*** Keywords ***
User hardcode the ekyc
    [Arguments]    ${email}    ${nik}

    Connect to postgres

    Wait Until Keyword Succeeds  
    ...    8x
    ...    3s
    ...    Hardcoded Ekyc    ${email}    ${nik}

    Press Keycode    4