# Object-oriented programming
FAQ / Crash course for Java (OOP).

***
## Table of contents
1. [Syntax and conventions](#Syntax-and-conventions)
    A. [Definitions](#Definitions)
    B. [Primitive types](#Primitve-types)
    C. [Modifiers](#Modifiers)
    D. [Naming conventions](#Naming-conventions)
2. Operators
    A. Arithmetic
    B. Relational
    C. Logical
    D. Assignment
    E. Miscellaneous
3. Control statements
    A. Conditional Execution
    B. Loops
    C. Flow control
4. Objects
    A. Instantiation
    B. Instance variables vs class variables
5. Tests
6. Running everything
7. Helpful links and credits

***
## Syntax and conventions
This guide will be usefull for everyone who wasn't able to get a good grasp on the topics during the lecture, was half-asleep at 8:45 in the morning, or simply wants to brush up their knowledge of the beautiful thing that is called Java. But before we get you on your way in your Java career, there a few things that will be helpful to know in your Java learning pursuits. Let's discuss those first.

### Definitions
**JVM:** The JVM, or Java Virtual Machine, is the virtual machine that executes java bytecode. Your knowledge of this beautiful piece of software doesn't have to be too extensive. All you have to know is that the JVM makes sure your code works on several platforms, without you having to rewrite it several times. 

**JRE:** The JRE, or the Java Runtime Environment, contains all libraries, the JVM and any other necessary components to run your Java program. 

**JDK:** The JDK, or the Java Development Kit, contains everything in the JRE, plus some extra goodies like compilers and debuggers. Useful for us!

**Object:** Now that we're done with the three letter definitions, we can continue with the useful stuff. An object is essentially a container for a set of states/behaviours (you could call this variables) and methods to interact with them. For example, a car has multiple different states and behaviours: color, brand, type, top speed, driving, out of gas. An object is an instance of a Class.

**Class:** You could see this as an template for Objects. In a Class you define the (default) states and behaviours of your Object. In the previous example of a car, you would define your Class as 'a car has a color which defaults to red, a brand and top speed that you define when creating a new car, and is by default not driving...'

**Method:** A method is the actual behavior of your object. This is where you write your logic and manipulate data.

**Instance Variables:** I've mentioned 'states' several times now, but what are states actually? They are defined with instance variables, which keep track of the current states of your object. Instance variables are like the normal variables you've heard about, but they're 'owned' by an object. If this definition sounds a bit vague, don't worry, instance variables will be discussed later on.

**Constant:** These are just like the regular physics constants you've learned about in high school, but in this case you can actually define them. Constants are just like normal variables, with one small detail: they can be set/changed/assigned only once. You'd normally prefix these variables with '*final*', and often '*static*'.

### Primitive Types
You've probably heard about these in lectures or came across one yourself (if not, you probably did see one, but didn't know it was a primitive): primitives. Just like in most other languages, Java has a set of primitive types, which you use to store the most basic types of data. Even if you somehow end up not directly writing them yourself, these are somehow used in everything you make. They are the building blocks of data manipulation.

**boolean:** This is about as basic as we can get, while still maintaining functionality. This type stores one of two possible states: true or false. So if you would want to store something like something being either enabled of disabled, this is the thing for you.

**byte:** You won't see this type often, but it can be used to save some space in some cases. As the name suggests this is an 8-bit integer, which means it can store values from -128 to +127. From the range you probably noticed something: it's an signed integer. That's because Java's primitives only store signed numbers, not unsigned. From now on I won't mention this anymore, because I assume you know.

**short:** This is also an integer value. This time of 16-bit, so that's -32,769 to +32,767.

**int:** You probably have seen this one already, since it's the 'normal' integer value. An int is a 32-bit value, so it's range is -2,147,483,648 - +2,147,483,647.

**long:** Another integer value. As the name suggests it can store bigger numbers than int. Since long is a 64-bit value, you can store anything between -9,223,372,036,854,775,808 and 9,223,372,036,854,775,807. You normally use this type when a function requires it, or when an int cannot store your desired number.

**float:** This is just a 32-bit floating-point value.

**double:** This is also a floating-point value, 64-bits this time. Watch out for [rounding off errors](https://www.geeksforgeeks.org/rounding-off-errors-java/) when using doubles and floats.

**char:** A char is a single 16-bit [Unicode](https://en.wikipedia.org/wiki/List_of_Unicode_characters) character. It can store values between '\u0000' and '\uffff'.

Should you prefer a more visual list of the primitive types:
![primitive_data_type](https://user-images.githubusercontent.com/41565823/46495600-1f9cb700-c816-11e8-9a29-a961a3be48eb.png)

#### Special mentions
**String:** While technically not a primitive type, a string will usally be part of any program. It is made up of an array of chars.

**Wrapper Types:** You may have come across classes like 'Integer' and 'Double' and wondered what the difference between those and primitive types are. These exists so you can use them in instances where an Object is required (try making an ArrayList with primitives). These can be used interchangeably with primitive types, but you should use primitive types whenever possible.

### Modifiers
Modifiers can be applied to a number of things: classes, variables and methods. They provide funtionality and control access to data.

##### Access control
These modifiers change the accessibility of data. It it generally best to be as restrictive as possible.

**public:** Externally visible from an instance of the class. You can acces this data from anywhere.

**protected:** This modifier makes something visible from inside the class, from the package and from any subclasses of the class.

**no modifier:** Without a modifier the data is accessible from anywhere within the same package

**private:** This modifier make something visible only to the class which contains it. 


If you like tables better:

|             | Class   | Package   | Subclass (same package)   | Subclass (different package)   | World |
| ----------- | :-----: | :-------: | :-----------------------: | :----------------------------: | :---: |
| public      | +       | +         | +                         | +                              | +     |
| protected   | +       | +         | +                         | +                              | -     |
| no modifier | +       | +         | +                         | -                              | -     |
| private     | +       | -         | -                         | -                              | -     |
*+ = accessible*
*- = not accessible*

#### Other modifiers
There are several other modifiers besides the two down below, but you won't use them as much. If you need more a list can be found [here](https://docstore.mik.ua/orelly/java-ent/jnut/ch03_14.htm).

**static:** This one is for class-level methods and variables. If you use this modifier, the data will remain constant rather than being controlled by individual instances.

**final:** As I quickly mentioned in definitions, the final modifier is used to define constants. When you use this modifier Java will not allow any changes to the data, except for the initial assignment (in class or constructor). 

### Naming conventions
Naming conventions are simply a set of rules to follow when deciding on names for your classes, packages, variables, methods and so on. These rules make it easier for you and other people to follow and understand your code. Nobody is forcing you to follow these conventions, but the future you and your peers will be thankful if you do. If you've programmed in another language for years and don't want to drop those naming conventions: no problem, but just make sure your code is clear and readable.

**Classes:** Classes should be named in UpperCamelCase. Examples: Lawyer, Prosecutor, Car.

**Methods:** Methods should be named in lowerCamelCase. Examples: submitAssignment(), isAwesome(), bufferScreen().

**Variables:** These should also be named in lowerCamelCase. Example: settingsFrame, keyPair, corePoolThreads.

**Packages:** Packages should be in lowercase. The regular structure of a package name is: <reversed.domain.name>.<project_name>[.<any_sub_packages>]. This is to avoid clashes. You probably don't own a domain name, so me.<your_name>.<project_name>[.<any_sub_packages>] should suffice. Example: nl.tudelft.peer

**Constants:** Constants should be in uppercase. Example: public static final float GUESSING_CORRECTION = -2.5;

Another important part of naming conventions is giving things *meaningful* names. If I read your code I should be able to understand what your functions do and what data your variables hold, without having to investigate. 


***
# WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP - WIP
*(Work in progress)*

**BASICS WITH HELLO WORLD**

First of all, I will give you a simple overview of how a Java program looks like. 
In the below code, I have created a class – MyFirstJavaProgram and printed “Hello World”. 
Go ahead and try to execute the below example in your Eclipse IDE. Do not worry, we will discuss about Java class in a while.
```
public class MyFirstJavaProgram {
       public static void main(String[] args)
   {
    System.out.println("Hello World");
   }
} 
```
Next, let us understand different member variables in Java. 

**MEMBER VARIABLES**

A member variable plays a major role in a class as it is used to store a data value. When we define a class, we can declare a member variable. These variables are members of a class.
Member variables are further classified into three types:

Local variable
Instance variable
Class/Static variable
Let me discuss about each one of them:

Local variable: These are the variables which are declared within the method of a class. Let’s understand this with a programmatic example:
```
public class Car {
      public void display(int m){  // Method
           int model=m;                 // Created a local variable model
           System.out.println("Model of the car is" +model);
     }
```
In the above code, my local variable is ‘model’ which I have declared inside a method ‘display’ which has a parameter ‘m’. 

Instance variable: Instance variable is declared in a class but outside a method, constructor or any block. Let’s understand this with a programmatic example. 

```
public class Car {
      public String color;     // Created an instance variable color
     
Car(String c)
   {
    color=c;
   }
 
public void display() {  // Method 
      System.out.println("color of the car is"+color);
   }
 
public static void main(String args[]){
              Car obj=new Car("black");
                obj.display();
       }
}
```
In the above code, ‘color’ is my instance variable which has a value “black” associated to it.

Class variable: Class variables are also called as static variables. These variables have only one copy that is shared by all the different objects in a class. Let’s understand this with a programmatic example. 

```
public class Car {
      public static int tyres;   // Created a class variable tyres
        public static void main(String args[]){
           tyres=4;
           System.out.println("Number of tyres are"+tyres);
        }
}
```
All cars must be having 4 tyres, right? So in my above code, I have declared a static variable as ‘tyre’ whose value remains same throughout the class.

**DATA TYPES**

A data type is used to represent different values which are stored in a variable. They are mainly classified into 4 different aspects – Integer, Float, Character and Boolean. You can refer to the below image to understand the different data types with respect to the memory allocated to them.

![primitive_data_type](https://user-images.githubusercontent.com/41565823/46495600-1f9cb700-c816-11e8-9a29-a961a3be48eb.png)

As you can see in the above image, data types are of 4 major types.

The first data type is an Integer which stores a numerical value.</br>
Now, if a numerical value contains decimal part, it will be referred as float.</br>
Next, if you wish to store a character, then the third data type i.e char is used. In char, you can store any alphabetical character as well as a special character.</br>
The last data type is Boolean which stores only ‘true’ or ‘false’ value.</br>

Let’s move forward and look at the various data operations which you can perform in Java.

**DATA OPERATORS**

There are mainly 4 different types of operators, which are listed below:

Arithmetic Operator: Perform arithmetic operations such as addition, subtraction, multiplication, division and modulus.

Unary Operator: Unary operators are used to increment or decrement a particular value. For example: ++ stands for increment, – – stands for decrement.

Relational Operator: It defines some kind of relation between two entities. For example: <, >, <=, >=, !=, ==.

Logical Operator: Logical operators are typically used with boolean (logical) values.

**CONTROL STATEMENTS**

Control statements are the statements that define the flow of your program. There are 3 types of control statements in Java: Selection, iteration and jump statements.

![control-statements](https://user-images.githubusercontent.com/41565823/46495877-db5de680-c816-11e8-9112-b42176bcbf04.png)

Selection Statements: 

Selection statements allow you to control the flow of the program during run time on the basis of the outcome of an expression or state of a variable. For example: you want to eat pizza, but then where can you get that pizza in best price. You can select between various popular options like Domino’s, Pizza Hut or any other outlet. So here you are following a selection process from the various options available.

Now these statements can be further classified into the following:

If-else Statements
Switch Statements

Refer to the following flowchart to get a better understanding of if-else statements:

![ifelse-flowchart-365x300](https://user-images.githubusercontent.com/41565823/46495943-0ba58500-c817-11e8-8f9c-3222474c94fe.png)

In this flowchart, the code will respond in the following way:

First of all, it will enter the loop where it checks the condition.
If the condition is true, the set of statements in ‘if’ part will be executed.
If the condition is false, the set of statements in the ‘else’ part will be executed.
Here you must have got an idea of how these if-else statements work. Now, how can we use these statements in Eclipse IDE? Let’s have a look at the code:

```
public class Compare {
     int a=10,
     int b=5;
  
if(a>b)
      {  // if condition
     System.out.println(" A is greater than B");
      }
else
      {     // else condition
      System.out.println(" B is greater");
      }
}
```
In the above code, I have created a class Compare where I have compared two numbers ‘a’ and ‘b’. First of all, it will go in ‘if’ condition where it checks whether the value of ‘a’ is greater than ‘b’ or not. If the condition is true, it will print “A is greater than B” else it will execute “B is greater”.

Moving on, we have Switch case statement. The switch statement defines multiple paths for execution of a set of statements. It is a better alternative than using a large set of if-else statements as it is a multi-way branch statement.

Refer to the following flowchart to get a better understanding of switch statements:

![switchstatement-java-271x300](https://user-images.githubusercontent.com/41565823/46496005-32fc5200-c817-11e8-81c2-5c0640f11103.png)

In this Switch case flowchart, the code will respond in the following steps:

First of all it will enter the switch case which has an expression.
Next it will go to Case 1 condition, checks the value passed to the condition. If it is true, Statement block will execute. After that, it will break from that switch case.
In case it is false, then it will switch to the next case. If Case 2 condition is true, it will execute the statement and break from that case, else it will again jump to the next case.
Now let’s say you have not specified any case or there is some wrong input from the user, then it will go to the default case where it will print your default statement.
Again, if we look at the code for switch statements in IDE, here it is: 

```
public class SwitchExample { 
     int week=7;
     String weeknumber;
 
switch(week){    // switch case
case 1:
          weeknumber="Monday";
       break;
     
case2:
          weeknumber="tuesday";
       break;
 
case3:
          weeknumber="wednesday";
       break;
 
default:        // default case
          weeknumber="invalid week";
       break;
     }
  System.out.println(weeknumber);
     } 
}
```
In the above code, I have created a class SwitchExample which has 3 cases that print days of a week. It also has a default case which is executed whenever a user doesn’t specify a case.

Concluding both of the selection statements, we understood that if we are comparing two statements, we are using if-else, but let’s say if you are checking a specific value against a particular statement, then we are going for the Switch statement.

Next, there is another set of control statements, i.e Iteration Statements.

Iteration Statements: In Java, these statements are commonly called as loops, as they are used to iterate through small pieces of code. Iteration statements provide the following types of loop to handle looping requirements.
