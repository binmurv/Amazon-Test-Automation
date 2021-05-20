*** Settings ***
Documentation  Amazon testing suite
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  Sign in to check out Test Case
    [Tags]  Smoke

    Open Browser                https://www.amazon.com/  chrome
    Maximize Browser Window
    Wait Until Page Contains    Today's Deals
    Input Text                  id=twotabsearchtextbox    vertical laptop mount
    Click Button                id=nav-search-submit-button
    Wait Until Page Contains    results for "vertical laptop mount"
    Click Image                 xpath=/html/body/div[1]/div[2]/div[1]/div/div[1]/div/span[3]/div[2]/div[3]/div/span/div/div/div[2]/div[1]/div/div/span/a/div/img
    Wait Until Page Contains    In Stock.
    Page Should Contain         In Stock.
    Click Button                id=add-to-cart-button
    Wait Until Page Contains    Added to Cart
    Page Should Contain         Added to Cart

    ${isModalVisible}=  Run Keyword And Return Status    Element Should Be Visible    xpath=//*[@id='attach-desktop-sideSheet']

    IF      ${isModalVisible}
        Wait Until Element Is Visible    xpath=//*[@id='attach-sidesheet-checkout-button']/span/input
        Click Button                     xpath=//*[@id='attach-sidesheet-checkout-button']/span/input
    ELSE
        Wait Until Element Is Visible    id=hlb-ptc-btn
        Click Button                     id=hlb-ptc-btn
    END


    Wait Until Page Contains       Sign-In
    Page Should Contain Element    xpath=//h1[contains(text(),'Sign-In')]
    Element Text Should Be         xpath=//h1[contains(text(),'Sign-In')]    Sign-In

    Sleep   3s
    Close Browser

*** Keywords ***

