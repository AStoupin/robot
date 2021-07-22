package ru.stoupin;

public class MyRobotLib {
    public String doSomething(String value) {
        return value + " something!";
    }

    public void StringShouldUppercase(String value) throws Exception {
        System.out.println("*INFO:" + System.currentTimeMillis() + "* Message with timestamp");
        if (value==null)
            return;

        if (!value.equals(value.toUpperCase())) {
            throw new Exception(value + " is not uppercase");
        }
    }
}
