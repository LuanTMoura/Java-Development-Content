# Spring Framework and Spring Boot
At the beginning, Spring Framework was used mainly with web development. Companies used to apply with distributed API's and microservices etc.
Spring is a set of tools for building microservices in Java. It simplifies development by handling aspects like cloud communication, microservice management, and messaging systems. It also provides intuitive APIs for encapsulating business logic.

### Best Practices with Spring | What I can use beside type my code from 0?

1. **Use what’s already available**: Spring has a vast array of ready-to-use features. If you’re writing infrastructure code that’s not directly connected to the business problem you’re solving, there’s probably something in Spring that can help.
    
2. **Integration via HTTP**: When integrating with other services via HTTP, consider using Feign, a declarative web service client. Spring Cloud provides a module that integrates Feign with Spring, allowing you to create an interface, annotate it, and receive an implementation at runtime.
    
3. **Data validation**: Use Spring’s support for Bean Validation to automatically validate data at various points in your system. You can annotate your classes and methods with validation constraints, and Spring will automatically apply these validations when the methods are invoked.
    
4. **Automatic validation**: You can also apply automatic validation to service methods. By annotating your class with `@Validated`, you can ensure that validation is applied automatically when the method is invoked, increasing the reliability of your system.

All of this gonna take reliability and efficiency of the system with these integrations.

# Bean inside Spring Framework

#### 01. What is bean?
- Is a class that we determine the Spring Container who manage the instance of all the classes;
#### 02. How can I show for Spring to manage Beans?
- We use the annotation ``@Components`` in a class, and Spring will be responsible manage the instances.
	- ``@Component`` is a generic annotation and you can use in any class, so Spring create more three stereotypes to specify and distinguish classes, they are:
		- ``@Service`` if there are classes that are part of business rules and you want that class as a Bean, you assign with this annotation;
		- ``@Repository`` classes that will happen persistency and data base transitions;
		- ``@Controller`` classes that will receive some requests.
#### 03. When and where Spring will create instances?
- When you declare classes as a Bean, you take them passable with injection point.
	- So, you can use ``@autowrite`` to say for Spring that class have injection point, so he will create, delete and manage the class, depending on the variable scope.

#### 04. When use ``@Bean``?
- ``@Bean`` is an annotation to say to Spring that he is responsible to manage our instances inside the classes that we've declared. But, how to manage imported classes?
	- We create methods inside the classes to return the class type inside ``@Configuration`` Spring class and these methods must be noted with ``@Bean``, and then, Spring will know that the class is passable to be accessed by external libraries.

## Spring Boot 3

Here’s a summarized overview of the Spring ecosystem and its projects:
Spring Ecosystem Overview: A collection of projects for Java application development.

- **Spring Boot**: A key project for starting APIs and implementations in the ecosystem.
- **Spring Security**: Provides authentication and authorization for applications.
- **Spring Cloud**: Subprojects for building Microservices architectures.
- **Spring Data**: Manages database interactions across different models.
- **Spring Web**: Used for building APIs within the Spring ecosystem.
- **Spring Framework**: The foundation that enables all these projects, with modules for data access, web, aspect-oriented programming, messaging, and the core container.
- **Inversion of Control**: Implemented via dependency injection in Spring.
- **Spring Boot Advantages**: Simplifies initial configurations, allowing developers to focus on business rules.

Spring Boot is emphasized for its ability to expedite the development process, especially for web applications and Microservices.

### Project API RESTful with Spring Boot 3
#### ↳ Using the Richardson's Maturity 

Spring tools used on this project:
- Spring Boot 3 e Java 17;
- Spring Web MVC;
- Spring Data JPA;
- Spring Validation;
- Spring Hateoas;

Data Base program used:
- Postgre (pgAdmin);

There's a site to help a prepare the ambient and construct a Java project with Spring dependencies pre-confiurated. And it's [Spring Initializr](https://start.spring.io/).

##### 01. Preparing the ambient and identifying the must important things;

When you create a project with this site, the main class is accompanied with the note ``@SpringBootApplication``. Also, creates the package Resources, with the archive ``application.properties`` that is used to config a database etc., and packages to organize interfaces for the view of MVC named as static and package.

```java
@SpringBootApplication  
public class SpringbootApplication {
    public static void main(String[] args) {  
       SpringApplication.run(SpringbootApplication.class, args);  
    }  
  
}
```

Inside the ``application.properties``, there are some code to stabilize the connection between Java and Postgre Database (the Connection Factory) and also create all setups automatically:

```java
spring.datasource.url=jdbc:postgresql://localhost:5432/products-api
spring.datasource.username=postgres
spring.datasource.password=example
spring.jpa.hibernate.ddl-auto-update

spring.jpa.properties.hibernate.jdbc.lob.non_contextual_creation=true
```

- ``spring.datasource.url= jdbc:postgresql://localhost: 5432/products-api`` is responsible to connect with the database path;
- ``spring.datasource.username=postgres`` access the username;
- ``spring.datasource.password=example`` access the password;
- ``spring.jpa.hibernate.ddl-auto-update`` ddl auto means that when you are maping the database, he creates automatically;
- ``spring.jpa.properties.hibernate.jdbc.lob.non_contextual_creation=true`` is used to avoid hibernate to create logs of error;

> Warning!
> - Check if the database is already created.


And, the identifier inside ``pom.xml`` archive is:

```xml
<dependency>  
    <groupId>org.springframework.boot</groupId>  
    <artifactId>spring-boot-starter-data-jpa</artifactId>  
</dependency>
```

##### 02. Model Class;

So, to start creating the packages, first initiate with the ``Model`` class:

```java
package com.example.springboot.models;  
  
public class ProductModel {

}
```

To map a java entity inside the database, we use some notes to help us do this "bridge": ``@Entity`` and ``@Table``. Also, use the implementation Serialized, which means to indicate to JVM that this class is passable to serializations and is used only to markable functions. And then, insert the serial version id, that is a number of version control.

```java
package com.example.springboot.models;  
  
import jakarta.persistence.Entity;  
import jakarta.persistence.Table;  
import java.io.Serializable;  
  
@Entity  
@Table (name = "TB-PRODUCTS")  
public class ProductModel implements Serializable {  
    private static final long serialVersionUID = 1L;     
}
```

And now, inside the class, insert the attributes and also, getters and setters:

```java
import java.math.BigDecimal; 
import java.util.UUID;
import static jakarta.persistence.GenerationType.*;

@Id  
@GeneratedValue(strategy = GenerationType.AUTO)  
private UUID idProduct;  
private String name;  
private BigDecimal value;
```

The note ``@GeneratedValue(strategy = GenerationType.AUTO)`` is responsible to generate id's automatically. ``UUID`` are an Universal form to generate different Id's for the same data – is commonly used in microservices architecture and distributed architecture. 

##### 03. Repository with JPA Repository;

The next step is the interface that we are going to use from JPR that we will already have several ready-made methods, without having to implement each one of them to, for example, save a certain resource, obtain a list of resources, to delete a resource, update resources, among other things that we are going to see.

- Create a package for repositories  (called repositories);
- Create a Java Interface called ``ProductRepository.

And, before start, add extension of JPA Repository to help us o everything said on the beginning and indicate what is the entity that will be manage.

```java
package com.example.springboot.repositories;  
  
import com.example.springboot.models.ProductModel;  
import org.springframework.data.jpa.repository.JpaRepository;  
  
import java.util.UUID;

public interface ProductsRepository extends JpaRepository<ProductModel, UUID>{ 
}
```

Is not obligated because Spring recognize JPA Repo as a note of a class that will be managed as Repository, but we'll use the bean annotation ``@Repository``.

```java
import org.springframework.stereotype.Repository;
  
@Repository  
public interface ProductsRepository extends JpaRepository<ProductModel, UUID> {  
  
}
```

##### 04. Controller;

Also, prepare the controller to prepare the CRUD operation, creating package for controllers and a class ``Controller``. And then, add the annotation ``@RestController``, a controller specific for Rest applications.

```java
package com.example.springboot.controllers;  
  
import org.springframework.web.bind.annotation.RestController;  
  
@RestController  
public class ProductController {  
}
```

With the controller created, now it's time to indicate injection points, there's a two ways to do this: with methods or the annotation ``@Autowired`` and point what will be injected.

```java
package com.example.springboot.controllers;  
  
import com.example.springboot.repositories.ProductRepository;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.web.bind.annotation.RestController;  
  
@RestController  
public class ProductController {  
    @Autowired  
    ProductRepository productRepository;  
}
```

###### POST or CREATE

Now, it's time to receive values by JSON format and transform in Java data using Java Records, a feature that was officially inserted in Java 16, which there are resources that give the possibility of easily initiates objects to transfer data such as DTO (Data Transfer Object), for example. So, create the DTO package and the archive is Java Record.

```java
package com.example.springboot.dtos;  
  
public record ProductRecordDTO() {  
}
```

As indicates in the code, a record supposedly receive some parameters, in this case, will receive data, so it's time to use the objects created inside Model class.

```java
package com.example.springboot.dtos;  
  
public record ProductRecordDTO(String nome, BigDecimal value) {  
}
```


> Observation
> - Java Records already have methods to assistant  the code configuration and is getters, to string, hash codes, and are final as default, so that's why doesn't generate setters.

And, to proceed, we will type some annotations to make the verification of data that will pass through the record:
- ``@NotBlank`` record don't receive blank data;
- ``@NotNull`` record don't receive null values.

```java
```java
package com.example.springboot.dtos;  
  
public record ProductRecordDTO(@NotBlank String nome, @NotNull BigDecimal value) {  
}
```

If it's a RESTful API, the code request must follow Richardson's Maturity. So here are the explanation line by line:
- ``@PostMapping("/products")`` - use HTTP protocol and POST method (also, a substantive = ``products``);

- ``public ResponseEntity<ProductModel> saveProduct (@RequestBody @Valid ProductRecordDto productRecordDto){`` - first, pass the entity that will be converted in a method and the parameters (``@RequestBody @Valid ProductRecordDto productRecordDto``) indicate the configuration of JSON request in HTTP client, according to the objects created – ``public record ProductRecordDto(@NotBlank String name, @NotNull BigDecimal value)`` – and really validate data requested;

- ``var productModel = new ProductModel();`` - is important to bear in mind that we'll save models and not DTO's. Models are our objects and DTO help to receive JSON data and validate each of them – Java 10 allows to create an object without mention the type, that's why we are using ``var``.

- ``BeanUtils.copyProperties(productRecordDto, productModel);`` - convert DTO to model. ``BeanUtils`` is a method that receive what is being converted and the type that will be received.

- ``return ResponseEntity.status(HttpStatus.CREATED).body(productRepository.save(productModel));``- this part can be read in three parts: ``status(HttpStatus.CREATED)`` if everything goes well, as we are creating a resource in the database, we need to send the client that this resource was created; ``body(productRepository``  in the body of this response, we can send what was saved, that is, the name, the value that the customer entered and also the UUID that will be generated when this save is done in the postgres database; ``save(productModel)`` JPA method and the object that receive data.

And then, that's the code:

```java
@RestController  
public class ProductController {  
    @Autowired  
    ProductRepository productRepository;  
  
    @PostMapping("/products")  
    public ResponseEntity<ProductModel> saveProduct (@RequestBody @Valid ProductRecordDto productRecordDto) {  
        var productModel = new ProductModel();  
        BeanUtils.copyProperties(productRecordDto, productModel);  
        return ResponseEntity.status(HttpStatus.CREATED).body(productRepository.save(productModel));  
    }  
}
```

To test if everything the API is ok, just paste the Tom Cat path created by Spring (it's ``8080``) and use the POST method to send for the client a request (you can do this in Postman).
The path:

``http://localhost:8080/products``

Request example:

```json
{
    "name": "Monitor Dell 27",
    "value": 4600.00
}
```

And, to be certain if the request or syntax match each other and everything is ok, will appear the protocol ``201``, in otherwise, ``400``.

###### GET (Get one/Get all) or READ

The unique difference here is the usage of ``OK`` status or protocol ``201`` and the JPA method ``findAll()`` – and ``@GetMapping`` annotation, of course.

```java
@GetMapping("/products")
public ResponseEntity<List<ProductModel>> getAllProducts(){  
    return ResponseEntity.status(HttpStatus.OK).body(productRepository.findAll());  
}
```
The example above show every data inside a list, and now, let's change the method to search specifically.
- ``@GetMapping("/products/{id}")`` - search by Id/PK;
- ``public ResponseEntity<Object> getOneProduct (@PathVariable(value="id") UUID id) {`` - Response Entity is defined as object because there will be two returns; ``@PathVariable(value="id")`` is getting exactly what is determined by URI (``{id}``) and then, the ``Id`` type ``UUID``;
- ``Optional<ProductModel> productO = productRepository.findById(id);`` - Find By Id is a JPA method that use the query "``Where Id = ...``";
- ``if(productO.isEmpty())`` - if there's a return, i mean, if there's a resource with the Id, we receive ``productO`` (or ``productOptional``, from Java Type ``Optional``);
- ``return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");`` - if is empty, status will be ``NOT_FOUND`` and inside the body message, a text "``Product not found.``";
- ``return ResponseEntity.status(HttpStatus.OK).body(productO.get());`` - there's something, so the status is ``OK`` and get the object.

The code:

```java
@GetMapping("/products/{id}")  
public ResponseEntity<Object> getOneProduct (@PathVariable(value="id") UUID id) {  
    Optional<ProductModel> productO = productRepository.findById(id);  
    if(productO.isEmpty()) {  
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");  
    }  
        return ResponseEntity.status(HttpStatus.OK).body(producto.get());  
}
```

###### PUT or UPDATE

To update something, it's similar to two examples above.
- ``@PutMapping("/products/{id}")`` - if I will update something, this already exist on database and have Id;
- ``public ResponseEntity<Object> updateProduct(@PathVariable(value="id") UUID id, @RequestBody @Valid ProductRecordDto productRecordDto)`` - receive Id first and after this, receive the request body with attributes given by the client (name, value etc.);
- ``Optional<ProductModel> productO productRepository.findById(id);`` - search in database;
- ``if(productO.isEmpty()){return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");}`` - check if it's ok with the request;
- ``var productModel = productO.get();`` - we create a object with a value that already exist inside database and passed through ``findById`` method and get to change/update;
- ``BeanUtils.copyProperties (productRecordDto, productModel);`` - convert DTO to model;
- ``return ResponseEntity.status(HttpStatus.OK).body(productRepository.save(productModel));`` - save the update with the same Id;

Complete code:

```java
@PutMapping("/products/{id}")  
public ResponseEntity<Object> updateProduct(@PathVariable(value="id") UUID id,  
                            @RequestBody @Valid ProductRecordDto productRecordDto){
  
    Optional<ProductModel> productO productRepository.findById(id);  
    if(productO.isEmpty()) {  
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");  
    }  
  
    var productModel = productO.get();  
    BeanUtils.copyProperties (productRecordDto, productModel);  
    return ResponseEntity.status(HttpStatus.OK).body (productRepository.save(productModel));  
}
```

###### DELETE

The addition on this part of CRUD is the annotation ``@DeleteMapping`` and the use of ``delete`` method of JPA. The code is:

```java
@DeleteMapping("/products/{id}")
public ResponseEntity<Object> deleteProduct (@PathVariable(value="id") UUID id) { Optional<ProductModel> producto = productRepository.findById(id);
if(producto.isEmpty()) {
return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");
}
productRepository.delete(producto.get());
return ResponseEntity.status(HttpStatus.OK).body ("Product deleted successfully.");
}
```

To test in Postman, just paste the URI with the Id.

##### 05. Hateoas

Now, to complete Richardson's Maturity, we insert Hateoas inside the code to navigate between the relationship in database. First, we extends our model class with a class of Hateoas called ``RepresentationModel`` passing what entity will be handle ``<ProductModel>``, like this:

```java
import org.springframework.hateoas.RepresentationModel;

public class ProductModel extends RepresentationModel<ProductModel> implements Serializable
```

Now, returning into controller class, we insert a new commands to reach this characteristic, and it's a list that use the ``productRepository.findAll()`` of ``Get all`` method to receive all products inside database.

After:

```java
@GetMapping("/products") public ResponseEntity<List<ProductModel>> getAllProducts(){
    return ResponseEntity.status(HttpStatus.OK).body(productRepository.findAll());  
    }
```

Before:

```java
@GetMapping("/products") public ResponseEntity<List<ProductModel>> getAllProducts(){  
    List<ProductModel> productlList = productRepository.findAll();  
    return ResponseEntity.status(HttpStatus.OK).body();  
    }
```

Continuing, after this, we create an if with for each structure to check if database have something and if it's ok, list all data.

```java
if(!productsList.isEmpty()) {  
    for(ProductModel product : productsList) {  
        UUID id = product.getIdProduct();  
product.add(linkTo(methodOn(ProductController.class).getOneProduct(id)).withSelfRel());  
    }  
}
```

Explaining the code:
- ``.add`` - is a method of Representation Model;
- ``linkTo`` - what endpoint/method will be redirected for client;
- ``methodOn`` - what is the controller and what is the method what will be redirected – specified here ``(ProductController.class).getOneProduct(id))``;
- ``withSelfRel()`` - method that will be shown request body.

And finishing this part, we put on request body, the list that was verified.

```java
@GetMapping("/products") public ResponseEntity<List<ProductModel>> getAllProducts(){  
    List<ProductModel> productsList = productRepository.findAll();  
    if(!productsList.isEmpty()) {  
        for(ProductModel product : productsList) {  
            UUID id = product.getIdProduct();  
            product.add(linkTo(methodOn(ProductController.class).getOneProduct(id)).withSelfRel());  
        }  
    }  
    return ResponseEntity.status(HttpStatus.OK).body(productsList);  
}
```

To complete the Richardson's Maturity, let's type a request  to show a link to browse and see the complete list, when you click inside a link (basically, the reverse way). And to do this, we change the reference of ``getOneProduct`` to ``getAllProducts`` inside the code of Get One method.

```java
@GetMapping("/products/{id}")  
public ResponseEntity<Object> getOneProduct (@PathVariable(value="id") UUID id) {  
    Optional<ProductModel> productO = productRepository.findById(id);  
    if(productO.isEmpty()) {  
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product not found.");  
    }
    productO.get().add(linkTo(methodOn(ProductController.class).getAllProducts()).withRel("Products List"));

    return ResponseEntity.status(HttpStatus.OK).body(productO.get());  
}
```

## What to do to improve the API?
1. Include pagination in the methods;
2. List all products;
3. Include filters to make the listing more dynamic for the client;
4. Insert error customizations;
5. Insert service layer as new business rules appear;
6. Create service layer;
7. Create Beans of the type ``@service``;
9. If you are going to work with dates, remember to maintain the standardization of dates.