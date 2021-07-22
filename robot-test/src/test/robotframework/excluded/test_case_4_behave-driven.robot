*** Settings ***
Documentation	 behavior-driven style: Given, When and Then are left out of the keyword definitions.
Library	 	OperatingSystem


*** Variables ***


*** Test Cases ***
Сервис возвращает хоть какие-то результаты
	Given CFL and F120 with new cars loaded
	When I create pledge report
	Then it contains that new cars
	

*** Keywords ***
CFL and F120 with new cars loaded
    Directory Should Exist    c:/temp

I create pledge report
    Directory Should Exist    c:/temp
    
it contains that new cars
    Directory Should Exist    c:/temp