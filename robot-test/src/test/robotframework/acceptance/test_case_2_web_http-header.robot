*** Settings ***
Library    HttpRequestLibrary
Library    Collections
Library    String


*** Settings ***
Documentation	Демо, как использовать пользовательские библиотеку httprequestlibrary

  
*** Variables ***
${get_result}=  0

*** Test Cases ***

Ресурс возвращает результаты с X-Frame-Options: DENY
	[Documentation]    Send GET request to get a header.
	Given The resurce http://www.ya.ru is run
	When I GET request to the resource
	Then The header of the result should contains a new X-Frame-Options eq DENY
	


***Keywords***
The resurce ${testServer} is run
    Log    ${testServer}
    Create Session  alias=yandex  url=${testServer}  verify=True  debug=0
I GET request to the resource
    ${resp} =  Get Request  alias=yandex  uri=/  params=query=ciao  headers=xx=1  timeout=1000
    Set Test Variable  ${get_result}  ${resp}
The header of the result should contains a new X-Frame-Options eq DENY
    Should Be Equal As Strings  ${get_result.status_code}  200
    Should Be Equal As Strings  ${get_result.headers['X-Frame-Options']}  DENY
