# Java Try Catch Study
The `try/catch` blocks are used to handle potential errors in the code. The `try` contains the code that may cause an error. If an error occurs, the `catch` comes into action to handle it and prevent the program from stopping. The `finally` is an optional block that performs tasks that should be done regardless of whether an error has occurred or not. It's a way to ensure that your program keeps running smoothly, even when things don't go as planned.

# Example of Try-Catch

On this example, will generate an error because `myNumbers[10]` doesn't exist.

```java
public class Main {
  public static void main(String[ ] args) {
    int[] myNumbers = {1, 2, 3};
    System.out.println(myNumbers[10]); // error!
  }
}
```

So, in this case, Try Catch help us to identify this error with more precision.

```java
public class Main {
  public static void main(String[ ] args) {
    try {
      int[] myNumbers = {1, 2, 3};
      System.out.println(myNumbers[10]);
    } catch (Exception e) {
      System.out.println("Something went wrong.");
    }
  }
}
```

So, ouput will be: 

    Something went wrong.

The `Finally` statement run the code, indifferent of `TryCatch` result.

```java
public class Main {
  public static void main(String[] args) {
    try {
      int[] myNumbers = {1, 2, 3};
      System.out.println(myNumbers[10]);
    } catch (Exception e) {
      System.out.println("Something went wrong.");
    } finally {
      System.out.println("The 'try catch' is finished.");
    }
  }
}
```

The `Throws` is used to create a customizable error, also is declared with an exception, like `ArithmeticException`, `FileNotFoundException`, etc. Example:

```java
public class Main {
  static void checkAge(int age) {
    if (age < 18) {
      throw new ArithmeticException("Access denied - You must be at least 18 years old.");
    }
    else {
      System.out.println("Access granted - You are old enough!");
    }
  }

  public static void main(String[] args) {
    checkAge(15); // Set age to 15 (which is below 18...)
  }
}
```

Output:

    Exception in thread "main" java.lang.ArithmeticException: Access denied - You must be at least 18 years old.
    at Main.checkAge(Main.java:4)
    at Main.main(Main.java:12)

# Checked and Unchecked exceptions

Java separetes errors by two types: Exceptions, errors that is possbile to solve and Errors, that isn't possible to be solved.

![img1](https://github.com/LuanTMoura/Study-Exceptions/assets/106880830/73ee5df7-cf19-4d0c-b422-b42e37dcd03c)


## Exceptions

On the example of image below, everyone who inherit a `RuntimeException` is considered a Uncheked Exception. Uncheked Exceptions are generlly used on business error, which means, errors unexpected by the application – problably occurred a logical error or programming error. In a conclusion, isn't obligatory to use `Throws` exceptions.

![img2](https://github.com/LuanTMoura/Study-Exceptions/assets/106880830/33722795-4ce8-4833-b088-44d184bb51ea)


Even inside the three of inherit, there are the Checked Exceptions, that inherit directly of Exception.

![img3](https://github.com/LuanTMoura/Study-Exceptions/assets/106880830/3ea9765b-39ad-4f86-8664-a7f370216281)


## Exceptions in pratice


### Unchecked exception

At this part, the intention behind the example is generate a logical error, so `TryCatch` helps to hold this error and show for us printing the exception. The example consists in do a validation of a value with a method and don't allow negative values being passed with a instance as an objetc in other class or declared with an object that prevents the code to be run.

The method that carries the bussines rule:
```java
public boolean deposit (double value){
if (valor < 0) {
System.out.println("Negative values isn't allowed.");
return false;
}
bankBalance += value;
return true;
}
```
The code described to generate an error:

```java
Classname objectName = new Classname ();

boolean inputValue = objectName.deposit (-50); // Error
if (inputValue){
System.out.println ("Deposit with success!");
}
```

So, to transform this into an Unchecked exception, in this conetxt described above, we use `IllegalArgumentException` as instance of a new object of an exception, because the error is logical and also it's self-evident as the value indeed is illegal. So, as a Unchecked exception, we use `Throw` to return for us the error.

```java
public boolean deposit (double value){
if (valor < 0) {
IllegalArgumentException illegalError = new IllegalArgumentException("Negative values isn't allowed.");
throw illegalError;
}
bankBalance += value;
}
```

And now, to catch the self-evident error, inside another class:

```java
Classname objectName = new Classname ();

try {
    objectName.deposit (valor: -50); 
} catch (IllegalArgumentException ex) { 
    System.out.println(ex.getMessage()); // Return the message from the method
}

```

### Checked exception

When we use the checked exception, we must make it clear that we are using an exception and it's obligated to do an action. There's two ways to hold exceptions in another class: using ``TryCatch` or pass the responsability to manage the exception for the Method used (generally, the Main method). So, the example will be:

Method that throws exception:
```java
public boolean deposit (double value) throws Exception{
if (valor < 0) {
Exception illegalError = new Exception ("Negative values isn't allowed.");
throw illegalError;
}
bankBalance += value;
}
```

Another class holding the error with `TryCatch`:
```java
Classname objectName = new Classname ();

try {
    objectName.deposit (valor: -50); 
} catch (Exception ex) { 
    System.out.println(ex.getMessage());
}
```

Treating errors with the `Main class`:

```java
public static void main(String[] args) throws Exception {
Classname objectName = new Classname ();
objectName.deposit (valor: -50);    
}
```
