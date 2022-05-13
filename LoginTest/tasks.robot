*** Settings ***
Documentation       Successful Login in http://automationpractice.com/index.php

Library             RPA.Browser.Selenium    auto_close=${FALSE}


*** Variables ***
${URL}=         http://automationpractice.com/index.php
${email}=       luiz@mail.com
${password}=    123456


*** Tasks ***
Login in website
    Open website
    Log in
    [Teardown]    Log out and close the browser


*** Keywords ***
Open website
    Open Available Browser    ${URL}

Log in
    Click Element    xpath://a[contains(text(),'Sign in') and @class='login']
    Input Text    id:email    ${email}
    Input Text    id:passwd    ${password}
    Click Button    id:SubmitLogin

Log out and close the browser
    Click Element    xpath://a[contains(text(),'Sign out') and @class='logout']
    Close Browser
