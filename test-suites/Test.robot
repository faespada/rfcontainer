*** Settings ***
Resource        ../resources/settings.robot
Suite Setup     Open Application  ${URL}
Suite Teardown  Close Browser

*** Variables ***
#Variables can be overwritten from the config files
${ENV}          Local
${URL}          https://mailtrap.io/inboxes

*** Test Cases ***
Fulfillment Workflow
    [Tags]  Test
    Sleep  2s
