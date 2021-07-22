*** Settings ***
Library  SeleniumLibrary
Library    Collections   


Documentation	Test open http://localhost:8080/watcher-app
...				Check if I may create a new route


Test Teardown    Close main page

*** Test Cases ***
Create new route
   [Documentation]   Check if I may create a new route
   Given I open http://localhost:8080/watcher-app page
   When I click new route button
     And fill-in rote name
     And I fill-in new route
     And save the route
   Then I see this rote on main page
     
Delete new route
   Given I open http://localhost:8080/watcher-app page
    When I click delete button
     And confirm delete
    Then Main page is empty
    
   
*** Keywords ***
I open ${first_page} page
   Open Browser	${first_page}	Chrome
   Capture Page Screenshot

I click new route button
    Click Button	 //*/button[@id='mainForm:routeTable:j_idt37_button']
    Click Link    //*/a[contains(@href, 'route-add/Empty')]
    Capture Page Screenshot
   

I fill-in new route
    Input Text    //*/pre[contains(@class, 'CodeMirror-line')]/span    <?xml version="1.0" encoding="UTF-8" standalone="yes"?> <route xmlns="http://camel.apache.org/schema/spring" autoStartup="false" description=" Some description of the route" ><from uri="file:/c:/Temp/1?move=.done&amp;moveFailed=.error&amp;delay=30000&amp;include=.*\.txt"/><to uri="file:/c:/Temp/"/></route>
    Capture Page Screenshot
    No Operation
fill-in rote name
    Input Text    //*/input[contains(@id, 'route-id')]   new-route
    Capture Page Screenshot    
    No Operation
save the route
    Click Button //*/button[@id='j_idt31:j_idt47'] 
    No Operation
I see this rote on main page
    No Operation
   
I click delete button
    Click Button	xpath://*/button[@id='mainForm:routeTable:actionDelete']
    Capture Page Screenshot

confirm delete
    Click Button	//*/button[contains(@class,'ui-confirmdialog-yes')]

Main page is empty
    No Operation
    
    
Close main page
   Close Browser