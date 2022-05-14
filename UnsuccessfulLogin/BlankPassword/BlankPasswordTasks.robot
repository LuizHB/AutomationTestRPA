*** Settings ***
Documentation       Unsuccessful Login with blank password in http://automationpractice.com/index.php

Library             RPA.Browser.Selenium    auto_close=${FALSE}


*** Variables ***
${URL}=         http://automationpractice.com/index.php
${email}=       luiz@mail.com
${password}=


*** Tasks ***
Unsuccessful login in website
    Open website
    Log in
    [Teardown]    Close the browser


*** Keywords ***
Open website
    Open Available Browser    ${URL}

Log in
    Click Element    xpath://a[contains(text(),'Sign in') and @class='login']
    Input Text    id:email    ${email}
    Input Text    id:passwd    ${password}
    Click Button    id:SubmitLogin
    Page Should Contain    Password is required.

Close the browser
    Close Browser
