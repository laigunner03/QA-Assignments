*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Variables ***
${symbol_menu}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div
${symbol_list}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[2]/div[2]/div/div[2]
${vol10_index}  //*[text()="Volatility 10 (1s) Index"]
${rect_preloader}   //*[@id="trade_container"]/div[4]/div/svg/rect
${buy_disable}  //*[@id="trade_container"]/div[4]/div/div/fieldset[1]/div
${buy}      //*[@id="dt_purchase_call_button"]

*** Keywords ***
ViolityTrading
    reload page
    wait until page does not contain element    ${rect_preloader}   60
    wait until element is visible  ${symbol_menu}    30
    click element   ${symbol_menu}
    wait until element is visible  ${symbol_list}    30
    click element   ${vol10_index}
    wait until page does not contain element  ${buy_disable}    60
    sleep   5
    wait until element is visible   ${buy}      50
    click element   ${buy}
*** Test Cases ***
Violity_Trading
    Login   ${my_email}    ${my_pw}
    Account
    ViolityTrading