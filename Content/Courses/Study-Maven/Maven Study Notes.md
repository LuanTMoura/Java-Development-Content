# Maven definition

Maven is an open-source automation tool for Java that helps to manage dependencies and task runner. In other words, he automates the use of Java dependencies and projects compilation. 
</br>
Here, I there are several notes by the content learned on the video of the short course of Maven with JDK. Check out the following main topics below.

# Installing

The most used way to install Maven is acessing his website [Apache Maven - Downloads](https://maven.apache.org/download.cgi) and download the zip archive. And now, doing the following steps:
    
- Unzip the archives on a wish path;
- Copy the wish path, access the Windows Enviroment and create a new variable pasting the path folder, with the name "M2_HOME";
- Click on edit PATH;
- Create a new variable and at the final of path, digit "\bin", to Windows recognize Maven commands;
- To finish, check if there's a variable with Java JDK path folder called "JAVA_HOME" to everything run with no problems. 

# Commands

The commands of Maven are compiled by a IDE compiler or a SO Terminal. And they are:

## Maven Wrapper

Helps embed Maven inside a project without install Maven on PC. The command is:

    mvn wrapper:wrapper

And to check if there's a valid Maven Project or a XML broken file, we use:

    mvnw validate

or

    .\mvnw validate

Of course, with the Java Path selected.

## Maven clean
Delete the "target" folder.

    mvn clean

## Maven compile
Compile Java Package classes under "target" folder.

    mvn compile

## Maven test
Run the files and test them.
    mvn test

or

    mvnw compile test

or

    .\mvnw compile test

## Maven clean compile test package
Compile classses, test the classes, take the source code and put on a JAR file. To check out if the JAR file was compiled, open the "target" folder and see the last file created.

    mvn clean compile test package

## Maven install
Do something similar of Maven clean compile test package, the difference is that JAR file is put on a local Maven repository. 

    mvn install

And, running the command, to acces the repository you just copy the path where Maven create the repository, as the output indicates (after INFO, written as Installing).

# Maven pom code structures

## Project indicator
```xml
<groupId>com.example.app</groupId>
<artifactId>project-name</artifactId>
<version>1.0-SNAPSHOT</version>
```
## Properties
On the example, the properies carries some tags that indicates version and specifically in maven, means something like "Maven, my project must be build with java eleven, for java eleven."

```xml
<properties>
<maven.compiler.source>11</maven.compiler.source>
<maven.compiler.target>11</maven.compiler.target>

<junit.version>5.8.2</junit.version>
</properties>
```
## Build

Build section allows to set plugins to Maven, and the example bellow is to test a project.

```xml
    <build>
        <plugins>
            <plugin>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
            </plugin>
            <plugin>
                <artifactId>maven-failsafe-plugin</artifactId>
                <version>2.22.2</version>
            </plugin>
        </plugins>
    </build>
```

## Dependencies and Scope

Dependencies section is used to download dependencies automatically on inside the Java Project. And, there are a tag called scope, that indiicates to Maven that those dependencies gonna run only inside test classes.

```xml
        <dependency>
            <groupId>org.junit.platform</groupId>
            <artifactId>junit-platform-launcher</artifactId>
            <version>1.8.2</version>
            <scope>test</scope>
         </dependency>
```

## How to download dependencies?

- Search for java + name of something you want + library;
    - Example: java mp3 library.
- Copy the dependency;
- Paste on dependency block.
