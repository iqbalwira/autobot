############# MANDATORY INCLUDES #############
*** Settings ***
Test Setup       Open Browser With Timeout
Test Teardown    Close Browser
Resource         ../resources/PageImporter.robot

*** Test Case ***
Login With User
    [Documentation]                                      As user, I want to login with phone number to the site
    Keywords.Verify Landing Page
    LoginPage.Go To Login Page
    LoginPage.Login
    LoginPage.Verify Page After Login
    Keywords.Logout
    Keywords.Verify Page After Logout
