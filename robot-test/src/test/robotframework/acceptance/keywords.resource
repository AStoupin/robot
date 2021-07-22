*** Settings ***
Documentation	 behavior-driven style: Given, When and Then are left out of the keyword definitions.
Library	 	OperatingSystem


*** Keywords ***
I create pledge report
    Directory Should Exist    c:/temp
