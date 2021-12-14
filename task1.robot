*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}    //*[text()="Log in"]


*** Keyword ***
Login
    [arguments]     ${my_email}    ${my_pw}
     Open Browser    url=https://app.deriv.com   browser=chrome
	 Set window size    1920    1080
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element   ${login_btn}
	 Click Element   ${login_btn}
     wait until page contains element   ${email_field}
	 input text     ${email_field}      ${my_email}
	 input text     ${pw_field}      ${my_pw}
	 Click Element   ${login_oauth_btn}


Account
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    //*[@id="dt_core_account-info_acc-info"]
    click element   //*[@id="dt_core_account-info_acc-info"]
    wait until page contains element    //*[@id="dt_core_account-switcher_demo-tab"]     60
    click element   //*[@id="dt_core_account-switcher_demo-tab"]
    click element   //*[contains(@id,"dt_VRTC")]
    reload page



*** Test Cases ***
Open_Deriv
    Login   ${my_email}    ${my_pw}
    Account