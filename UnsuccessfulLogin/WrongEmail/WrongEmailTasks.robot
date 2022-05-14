*** Settings ***
Documentation       Unsuccessful Login with wrong email in http://automationpractice.com/index.php

Library             RPA.Browser.Selenium    auto_close=${FALSE}


*** Variables ***
${URL}=         http://automationpractice.com/index.php
${email}=       ssasdd@fffff.asasa
${password}=    asssas


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
    Page Should Contain    Authentication failed.

Close the browser
    Close Browser
