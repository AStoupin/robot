*** Settings ***
Documentation	Демо, как использовать пользовательские библиотеки с keywords and web service call
Library	 	org.robotframework.javalib.library.AnnotationLibrary	 org/wuokko/robot/restlib/*.class
  
*** Variables ***
${post_result_id}=  0

*** Test Cases ***

Сервис возвращает хоть какие-то результаты
	[Documentation]    Send POST with new data.
	Given The service is run
	When I POST service with new data
	Then the result should contains a new id > 0 
	


***Keywords***
The service is run
    [Documentation]    Check the service is available
    Find Json Element	https://jsonplaceholder.typicode.com/todos/1	$.title

I POST service with new data
	${id}=	Find Json Element	https://jsonplaceholder.typicode.com/todos/	$.id	POST	{"userId": 1, "id": 333, "title": "1111111", "body": "body" }
   	Log    ${id}
   	Set Test Variable  ${post_result_id}  ${id}

the result should contains a new id > 0
    Log    ${post_result_id} 
    Should Be True  ${post_result_id} > 0
    
