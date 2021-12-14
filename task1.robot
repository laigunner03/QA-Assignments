*** Settings ***
Library     SeleniumLibrary
Resource   common.robot
*** Variables ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}    //*[text()="Log in"]


*** Keyword ***



*** Test Cases ***
Open_Deriv
    Login   ${my_email}    ${my_pw}
    Account