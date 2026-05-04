*** Settings ***
Library           FakerLibrary    locale=id_ID
Library           String
Library           DateTime

*** Variables ***
${EMAIL_DOMAIN}   yopmail.com
${pin}            123456

*** Keywords ***
Generate Registration Data
    #Generate Name
    ${first_name}=    FakerLibrary.First Name
    ${last_name}=     FakerLibrary.Last Name
    ${full_name}=     Catenate    SEPARATOR=${SPACE}    ${first_name}    ${last_name}
    
    #Generate Email
    ${timestamp}=       Get Current Date    result_format=%H%M%S
    ${clean_name}=      Replace String    ${full_name}    ${SPACE}    .
    ${clean_name}=      Convert To Lowercase    ${clean_name}

    ${email}=           Catenate
    ...    SEPARATOR=
    ...    ${clean_name}
    ...    .
    ...    ${timestamp}
    ...    @${EMAIL_DOMAIN}

    #Generate Phone
    ${random_digits}=   Generate Random String    10    [NUMBERS]
    ${phone}=           Catenate    SEPARATOR=    8    ${random_digits}

    #Generate NIK
    ${area}=    Set Variable    317401
    ${birth}=   Get Current Date    result_format=%d%m%y
    ${rand}=    Evaluate    str(random.randint(1000,9999))    modules=random
    ${nik}=     Set Variable    ${area}${birth}${rand}

    RETURN    ${full_name}    ${email}    ${phone}    ${nik}

Generate Data
    ${full_name}    ${email}    ${phone}  ${nik} =    Generate Registration Data