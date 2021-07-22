*** Settings ***
Documentation	Демо, как использовать пользовательские библиотеки с keywords
Library	 	OperatingSystem
Library	 	ru.stoupin.MyRobotLib
Resource    keywords.resource

*** Variables ***


*** Test Cases ***
Просто проверка команд (keywords) из пользовательско библиотеки
	${r} =  do something	xxx
	Log	${r}
	String Should UpperCase	XXX
	I create pledge report
