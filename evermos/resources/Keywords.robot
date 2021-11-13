Resource    ../PageImporter.robot

*** Variable ***
${APP_NAVBAR}                document.getElementsByClassName("appNav")
${APP_NAVBAR_AKUN}           document.getElementsByClassName("appNav__item")[4]
${BUTTON_KELUAR_APLIKASI}    document.getElementsByClassName("menuGroup__item")[15]


*** Keywords ***
Scroll To Element
    [Arguments]                         ${element}
    Wait Until Page Contains Element    ${element}                      timeout=3     error=There's no ${element}
    ${ver}=                             Get Vertical Position           ${element}
    Execute Javascript                  window.scrollTo(0,${ver}-90)
    Sleep                               1

###################### OPEN BROWSER ##########################

Open Browser With Timeout
    [Timeout]                  120 Second
    Open Browser               ${LANDING_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep                      3

###################### LOGOUT ##########################

Logout
    Click Element                 dom=${APP_NAVBAR_AKUN}
    Keywords.Scroll To Element    dom=${BUTTON_KELUAR_APLIKASI}
    Click Element                 dom=${BUTTON_KELUAR_APLIKASI}

###################### VERIFY ##########################

Verify Landing Page
    Sleep                          1
    Location Should Contain        evermos.com/home
    Page Should Contain Element    id=sticky-wrapper

Verify Page After Logout
    Sleep                              1
    Page Should Not Contain Element    dom=${APP_NAVBAR}
    Page Should Contain                Ayo Masuk!
    Location Should Contain            ${SERVER}/login
