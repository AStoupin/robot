*** Settings ***
Library  SeleniumLibrary
Library    Collections   


Documentation	Test open http://www.ya.ru
...				Check, that the site could be open and 
...				after button click relocated to yandex.ru

Test Teardown    Close main page

*** Test Cases ***
Find button click transfers to new page
   Given I open http://www.ya.ru page
   When I fill input query
     And Push find button
   Then Yandex transfer me to yandex.ru page
     And Input field contains given serach string

   
*** Keywords ***
I open ${first_page} page
   Open Browser	${first_page}	Chrome
   Capture Page Screenshot

I fill input query
   Input Text	id:text	hello 

Push find button   
   Click Button	tag:button

Yandex transfer me to ${second_page} page   
   Location Should Contain	${second_page} 
#   Fail    This is a rather boring example...

    
Input field contains given serach string
   Capture Page Screenshot
   ${text}=    Get Element Attribute   xpath: //*/input[@name='text']  value
   Should Be Equal  ${text}    hello

Close main page
   Close Browser