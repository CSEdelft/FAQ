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
