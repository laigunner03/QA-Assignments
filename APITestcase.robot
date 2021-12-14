*** Settings ***
Library     SeleniumLibrary
Resource   common.robot
*** Variables ***
${account}  //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div/span/a
${API}  //*[@id="dc_api-token_link"]
${scope_container}  //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]
${submit_btn}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
#checkbox
${read_checkbox}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
${trade_checkbox}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
${payments_checkbox}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
${admin_checkbox}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
${tradinginfo_checkbox}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]
#active checkbox
${read_clicked}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[1]/label/span[1]/svg
${trade_clicked}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[2]/label/span[1]/svg
${payments_clicked}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[3]/label/span[1]/svg
${admin_clicked}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[4]/label/span[1]/svg
${tradinginfo_clicked}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[1]/div[2]/div/div/div/div[5]/label/span[1]/svg
#namefield
${name_field}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input
${str_error}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/div
#API Token List
${list_first_line}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[1]
#API Token List btn
${delete_btn}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/button
${yesdelete}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[2]
${nodelete}     //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[1]

*** Keyword ***
APISettings
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until element is visible    ${account}
    click element   ${account}
    wait until element is visible   ${API}      30
    click element   ${API}
    sleep   10
APIScopes
    wait until element is visible   ${scope_container}
    page should contain element  //*[text()="Read"]
    page should contain element  //*[text()="Trade"]
    page should contain element   //*[text()="Payments"]
    page should contain element   //*[text()="Admin"]
    page should contain element   //*[text()="Trading information"]
CreateToken0Scope
    page should not contain element     ${read_clicked}
    page should not contain element     ${trade_clicked}
    page should not contain element     ${payments_clicked}
    page should not contain element     ${admin_clicked}
    page should not contain element     ${tradinginfo_clicked}
    input text  ${name_field}   TestAPI0Scope
    click element   ${submit_btn}
    page should not contain element     ${list_first_line}
CreateToken1Scope
    click element   ${read_checkbox}
    input text  ${name_field}   TestAPI1Scope
    click element   ${submit_btn}
    sleep   5
    page should contain element     //*[text()="TestAPI1Scope"]
CreateToken2Scope
    click element   ${read_checkbox}
    click element   ${trade_clicked}
    input text  ${name_field}   TestAPI2Scope
    sleep   5
    click element   ${submit_btn}
    page should contain element     //*[text()="TestAPI2Scope"]
CreateToken5Scope
    click element   ${read_checkbox}
    click element   ${trade_clicked}
    click element   ${payments_checkbox}
    click element   ${admin_checkbox}
    click element   ${tradinginfo_checkbox}
    input text  ${name_field}   TestAPI3Scope
    sleep   5
    click element   ${submit_btn}
    page should contain element     //*[text()="TestAPI3Scope"]
EmptyStringName
    click element   ${read_checkbox}
    click element   ${submit_btn}
    page should not contain element     ${list_first_line}
SingleStringName
    click element   ${read_checkbox}
    input text  ${name_field}   A
    click element   ${submit_btn}
    page should contain element   ${str_error}
33StringName
    click element   ${read_checkbox}
    input text  ${name_field}   111111111111111111111111111111111
    click element   ${submit_btn}
    page should contain element   ${str_error}
SpecialCharName
    click element   ${read_checkbox}
    input text  ${name_field}   @
    click element   ${submit_btn}
    page should contain element   ${str_error}
DuplicateToken
    click element   ${read_checkbox}
    input text  ${name_field}   TestAPI1Scope
    click element   ${submit_btn}
    sleep   5
    page should contain element     //*[text()="TestAPI1Scope"]
    click element   ${read_checkbox}
    input text  ${name_field}   TestAPI1Scope
    click element   ${submit_btn}
    sleep   5
    page should contain element     //*[text()="TestAPI1Scope"]
    page should contain element     //*[text()="TestAPI1Scope"]
ValidName
    click element   ${read_checkbox}
    input text  ${name_field}   TestAP5Scope
    click element   ${submit_btn}
    sleep   5
    page should contain element     //*[text()="TestAP5Scope"]
DeleteTokenYes
    click element   ${read_checkbox}
    input text  ${name_field}   TestAPI1Scope
    click element   ${submit_btn}
    sleep   5
    page should contain element     //*[text()="TestAPI1Scope"]
    sleep   5
    click element   ${delete_btn}
    sleep   5
    click element   ${yesdelete}
    sleep   5
    page should not contain element     //*[text()="TestAPI1Scope"]
DeleteTokenNo
    click element   ${read_checkbox}
    input text  ${name_field}   TestAPI1Scope
    click element   ${submit_btn}
    sleep   5
    page should contain element     //*[text()="TestAPI1Scope"]
    sleep   5
    click element   ${delete_btn}
    sleep   5
    click element   ${nodelete}
    sleep   5
    page should contain element     //*[text()="TestAPI1Scope"]
CloseBtn
    click element   //*[@id="app_contents"]/div/div/div/div/div[1]/div/div[2]
    sleep   20
    page should contain element     //*[@id="trade"]/div/div[1]/div/div/div[1]/div[2]/div[13]
*** Test Cases ***
APISettings
    Login   ${my_email}    ${my_pw}
    APISettings
#Test one by one and clear Token list after each test to prevent errors
#    APIScopes
#    CreateToken0Scope
#    CreateToken1Scope
#    CreateToken2Scope
#    CreateToken5Scope
#    EmptyStringName
#    SingleStringName
#    33StringName
#    SpecialCharName
#    DuplicateToken
#    ValidName
#    DeleteTokenYes
#    DeleteTokenNo
#    CloseBtn