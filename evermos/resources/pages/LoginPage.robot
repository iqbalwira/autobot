*** Settings ***
Resource                    ../Variables.robot
Resource                    ../Settings.robot
Resource                    ../Keywords.robot

*** Variable ***
${APP_NAVBAR}                                document.getElementsByClassName("appNav")
${BUTTON_MASUK}                              document.getElementsByClassName("btn--block")[0]
${BUTTON_LAIN_KALI_ONESIGNAL}                document.getElementsByClassName("secondary")[0]
${PASSWORD}                                  password
${PASSWORD_FIELD}                            document.getElementsByClassName("inputText__input")[1]
${PHONE_NUMBER}                              081223334444
${PHONE_NUMBER_FIELD}                        document.getElementsByClassName("inputText__input")[0]

*** Keywords ***
###################### LOGIN ##########################
Go To Login Page
    Click Element                            xpath=//a[@href='https://evermos.com/login']

Login
    Sleep                                    1
    Page Should Contain                      Ayo Masuk!
    Input Text                               dom=${PHONE_NUMBER_FIELD}              ${PHONE_NUMBER}
    Input Password                           dom=${PASSWORD_FIELD}                  ${PASSWORD}
    Keywords.Scroll To Element               dom=${BUTTON_MASUK}
    Click Element                            dom=${BUTTON_MASUK}

###################### VERIFY ##########################
Verify Page After Login
    Sleep                                    1
    Wait Until Element Is Visible            dom=${APP_NAVBAR}                      timeout=15
    Run Keyword And Ignore Error             Click Element                          dom=${BUTTON_LAIN_KALI_ONESIGNAL}
    Page Should Not Contain                  Ayo Masuk!