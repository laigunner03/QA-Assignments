*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Variables ***
${symbol_menu}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div
${symbol_list}  //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[1]/div[2]/div/div[2]
${50index}      //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[2]/div[2]/div/div[2]/div[1]/div[7]
${contract_type}    //*[@id="dt_contract_dropdown"]
${multipler_contract}   //*[@id="dt_contract_multiplier_item"]
${stop_loss}        //*[@id="trade_container"]/div[4]/div/fieldset[4]/div[1]
${stop_loss_tick}   //*[@id="trade_container"]/div[4]/div/fieldset[4]/div[1]/label/span[1]/svg
${deal_cancel}      //*[@id="trade_container"]/div[4]/div/fieldset[5]/div
${deal_cancel_tick}     //*[@id="trade_container"]/div[4]/div/fieldset[5]/div[1]/label/span[1]/svg
${multiplier_dropdown}  //*[@id="dropdown-display"]
${stakes_txtbox}    //*[@id="dt_amount_input"]
${deal_cancelation_fee}     //*[@id="dt_purchase_multup_price"]/div/div[2]

*** Keywords ***
MultiplierContract
    reload page
#    wait until page does not contain element    ${rect_preloader}   60
    wait until element is visible  ${symbol_menu}    30
    click element   ${symbol_menu}
    wait until element is visible  ${symbol_list}    30
    click element   ${symbol_list}
    wait until element is visible  ${50index}    30
    click element   ${50index}
    wait until element is visible   ${contract_type}    30
    click element   ${contract_type}
    click element   ${multipler_contract}
    #Key point 1
    page should not contain element     //*[text()="Payout"]
    #Key point 2
    click element   ${stop_loss}
    click element   ${deal_cancel}
    page should not contain element     ${stop_loss_tick}
    click element    ${stop_loss}
    page should not contain element     ${deal_cancel_tick}
    #Key point 3
    click element   ${multiplier_dropdown}
    page should contain element     //*[text()="x20"]
    page should contain element     //*[text()="x40"]
    page should contain element     //*[text()="x60"]
    page should contain element     //*[text()="x100"]
    page should contain element     //*[text()="x200"]
    #Key point 4
    click element   ${stakes_txtbox}
    press keys      ${stakes_txtbox}     CTRL+A   BACKSPACE
    input text  ${stakes_txtbox}    10
    sleep   5
    ${low_value}         get text   ${deal_cancelation_fee}
    press keys      ${stakes_txtbox}     CTRL+A   BACKSPACE
    input text  ${stakes_txtbox}    150
    sleep   5
    ${high_value}=      get text   ${deal_cancelation_fee}
    Should Be True     ${low_value.replace(' USD','')}<${high_value.replace(' USD','')}
    #Key point 5
    press keys      ${stakes_txtbox}     CTRL+A   BACKSPACE
    input text  ${stakes_txtbox}    2001
    page should contain element     //*[text()="Maximum stake allowed is 2000.00."]
    #Key point 6
    press keys      ${stakes_txtbox}     CTRL+A   BACKSPACE
    input text  ${stakes_txtbox}    0
    page should contain element     //*[text()="Maximum stake allowed is 2000.00."]
    #Key point 7

    #Key point 8

    #Key point 9

#    input text     ${duration_number_txtbox}       2
#    click element   ${barrier_txtbox}
#    press keys      ${barrier_txtbox}      CTRL+A   BACKSPACE
#    input text      ${barrier_txtbox}       -0.22
#    click element   ${payout_btn}
#    ${value}=     Get Element Attribute   ${payout_txtbox}      value
#    ${backspaces count}=    Get Length      ${value}
#    Run Keyword If    """${value}""" != ''    # if there's no current value - no need to slow down by an extra SE call
#    ...     Repeat Keyword  ${backspaces count +1}  Press Key  ${payout_txtbox}   \\08    # this is the code for the backspace key; "backspaces count +1" - just too be sure :)
#    input text      ${payout_txtbox}    10   clear=True
##    wait until page does not contain element  ${buy_disable}    60
#    sleep   5
#    wait until element is visible   //*[text()="Contracts more than 24 hours in duration would need an absolute barrier."]      50

*** Test Cases ***
MultiplierContract
    Login   ${my_email}    ${my_pw}
    Account
    MultiplierContract