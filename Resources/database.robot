*** Settings ***
Library  DatabaseLibrary
Library  Collections
Library  String
# *** Variables ***
# ${DB_HOST}          ***.***.***.*
# ${DB_PORT}          ****
# ${DB_USER}          *********
# ${DB_PASSWORD}      *************************************
# ${DB_NAME}          *************

# *** Variables ***
# ${DB_HOST}          ***.***.**.*
# ${DB_PORT}          ****
# ${DB_USER}          ********
# ${DB_PASSWORD}      **************************
# ${DB_NAME}          ***********

*** Variables ***
${DB_HOST}          ***.***.**.***
${DB_PORT}          ****
${DB_USER}          ********
${DB_PASSWORD}      **************************
${DB_NAME}          ***********

*** Keywords ***
Connect To Postgres
    Connect To Database
    ...    psycopg2
    ...    host=${DB_HOST}
    ...    port=${DB_PORT}
    ...    user=${DB_USER}
    ...    password=${DB_PASSWORD}
    ...    database=${DB_NAME}

 Get Latest OTP From DB
    [Arguments]    ${email}

    ${query}=    Catenate
    ...    SELECT message FROM mbl_l_otp
    ...    WHERE target = '${email}'
    ...    ORDER BY id_log_otp DESC LIMIT 1;

    ${result}=    Query    ${query}

    Log    Raw DB result: ${result}   

    Should Not Be Empty    ${result}

    ${otp}=    Set Variable    ${result[0][0]}
    RETURN    ${otp}

Hardcoded Ekyc
     [Arguments]    ${email}    ${nik}
     ${query}=    Catenate
    ...    UPDATE mbl_m_users
    ...    SET is_ocr = 1, is_fc = 1, is_liveness = 1, is_dukcapil = 1, is_signature = 1, is_ekyc = 1, nik = '${nik}', name = 'MOCK EKYC USER', dob = '1990-06-15', pob = 'JAKARTA'
    ...    WHERE email = '${email}'
    Execute Sql String    ${query}
