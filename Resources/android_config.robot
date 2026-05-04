*** Settings ***
Library  AppiumLibrary  WITH NAME  Mobile
Library  BuiltIn
Library  Process

*** Variables ***
${REMOTE_URL}       http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      RRCY4020NVT
${UDID}             RRCY4020NVT
${AUTOMATION_NAME}  UiAutomator2
${APP_PACKAGE}      com.kbij.skorku

*** Keywords ***
Open the Apps
    Run Process    adb    shell    am    force-stop    ${APP_PACKAGE}
    Mobile.Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    udid=${UDID}    
    ...    automationName=${AUTOMATION_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    autoGrantPermissions=true
    ...    noReset=true

Teardown Test
    Mobile.Close Application