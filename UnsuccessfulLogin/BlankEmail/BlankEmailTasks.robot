*** Settings ***
Documentation       Unsuccessful Login with blank email in http://automationpractice.com/index.php

Library             RPA.Browser.Selenium    auto_close=${FALSE}


*** Variables ***
${URL}=         http://automationpractice.com/index.php
${email}=
${password}=    123456


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
    Page Should Contain    An email address required.

Close the browser
    Close Browser
