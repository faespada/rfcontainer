*** Settings ***
Resource  Variables.robot

*** Keywords ***
Open Application
    [Arguments]  ${URL}
    Set Global Variables
    Log To Console  Initializing Automated Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To  ${URL}
    Set Window Size  ${1920}  ${1080}
    Sleep  2s

Set Current Date
    ${DATE}  Get Current Date
    ${DATE}  Convert Date  ${DATE}  result_format=%Y-%m-%d
    Set Global Variable  ${DATE}

Set Global Variables
    Set Current Date

Create Test Documentation
    ${tempdate}  Get Current Date
    &{testdoc}   Create Dictionary  name=QBOSyncTest  status=Completed  date=${tempdate}
    ${docJSON}   Json.Dumps  ${testdoc}
    Set Test Documentation  Tests:      append=yes
    Set Test Documentation  ${SOAlist}  append=yes
    Set Test Documentation  End Test    append=yes
    Log To Console  Documentation log