*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser

#Resource

*** Variables ***
${Error_Message_Login}        css:.alert-danger


*** Test Cases ***

Validate UnSuccesful login
    open the browser with Mortgage payment url
    Fill the login form
    wait untill it checks and display error message
    verfiy error message is correct

*** Keywords ***
open the browser with Mortgage payment url
    Create Webdriver     Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise

Fill the login form
    Input Text            id:username    rahulshettyacademy
    Input Password        id:password    123456
    Click Button          signInBtn

wait untill it checks and display error message
    Wait Until Element Is Visible        ${Error_Message_Login}

verfiy error message is correct
  ${result}=         Get Text        ${Error_Message_Login}
  Should Be Equal As Strings        ${result}        Incorrect username/password.
  Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.

