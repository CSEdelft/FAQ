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
