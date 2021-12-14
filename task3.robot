*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Variables ***
${symbol_menu}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div
${forex_list}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[1]/div[2]/div/div[3]
${lower_contract}  //*[text()="AUD/USD"]
${contract_type}    //*[@id="dt_contract_dropdown"]
${high/low_contract}    //*[@id="dt_contract_high_low_item"]
${duration_number_txtbox}  //*[@id="dt_simple_duration_datepicker"]/div/div/input
${payout_btn}   //*[@id="dc_payout_toggle_item"]
${payout_txtbox}    //*[@id="dt_amount_input"]
${rect_preloader}   //*[@id="trade_container"]/div[4]/div/svg/rect
${buy_disable}  //*[@id="trade_container"]/div[4]/div/div/fieldset[2]/div
${buy}      //*[@id="dt_purchase_put_button"]

*** Keywords ***
LowerContract
    reload page
    wait until page does not contain element    ${rect_preloader}   60
    wait until element is visible  ${symbol_menu}    30
    click element   ${symbol_menu}
    wait until element is visible  ${forex_list}    30
    click element   ${lower_contract}
    wait until element is visible   ${contract_type}    30
    click element   ${contract_type}
    click element   ${high/low_contract}
    input text     ${duration_number_txtbox}       2
    click element   ${payout_btn}
    ${value}=     Get Element Attribute   ${payout_txtbox}      value
    ${backspaces count}=    Get Length      ${value}
    Run Keyword If    """${value}""" != ''    # if there's no current value - no need to slow down by an extra SE call
    ...     Repeat Keyword  ${backspaces count +1}  Press Key  ${payout_txtbox}   \\08    # this is the code for the backspace key; "backspaces count +1" - just too be sure :)
    input text      ${payout_txtbox}    15.50   clear=True
#    wait until page does not contain element  ${buy_disable}    60
    sleep   5
    wait until element is visible   ${buy}      50
    click element   ${buy}
*** Test Cases ***
Lower_Contract_Trading
    Login   ${my_email}    ${my_pw}
    Account
    LowerContract