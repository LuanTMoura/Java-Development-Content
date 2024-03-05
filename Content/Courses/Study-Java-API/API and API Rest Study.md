# API and API Rest

API it's a Sail for Application Program Interface, in other perspective, it's an interface between application and programmation. API is commonly associated exclusively with API Rest and HTTP development, but an Operational System can also provides API for users and make possible to access archives and do several actions with them.

## API REST

REST is an API that uses HTTP protocol, version 1.1 – which means, beside the main methods of HTTP like, GET, POST and HEAD, he also offers others like PUT, DELETE, TRACE and CONNECT. Is an architectural concept to implement API's.

## Endpoints

Endpoints means what the service exposes and is defined by three sails: A (Address, where the service are hosted), B (Binding, how the service can be accessed) and C (Contract, what can be view on the service); and an example is Google Cloud Endpoints, with it, it is possible to deploy, protect, monitor, analyze, and also broadcast your APIs with the same infrastructure used by Google in its own APIs.

## SSL

Secure Sockets Layer is a security protocol that creates a encripted link between a web server and web navigator and API use this a lot. To do this connection, are commonly used **Tokens**, that helps to maintain the security of the data that will be passed on the endpoints (It's like a password to access data).

## JSON 

As the XML format, JSON is used to return API data, which means, a way to transport data on the web (client >> server). It's similar to JavaScript object, but it has its own rules, such as: only double quotes, no comments, cannot have a comma after the last element of arrays, etc. Example:

```json
[
{name: "José", lastName: "Augusto", _id: 123}, {name: "Joaquina", lastName: "Silva", id: 124}
]
```

## Status Code

Translation: Standardized code to communicate to the client the status of an HTTP request, that is, the result of an HTTP connection: Success (200); Error (500); Unauthorized (401), Not Found (404) etc.

##  How to test an API? 

It's commonly used Postman and Insomnia softwares to test an API.

## REST x SOAP

The difference is that SOAP is a rigid protocol that only uses XML format to do a conenction with server, which means, is a protocol that standardize messages that communicates with API's. Besides this, he also can use another protocols to transit on web services.
Rest emerged with the idea of to make soft the archteture style, use more verbs (methods) than SOAP and less overhead (time and work of send message) than him.

# API RESTful

RESTful is the implementation of concept of Rest in some API. The difference of REST an RESTful is: REST is an abstract concept and the other is an API that uses best pratices of programming.

## Maturity of Richardson

It's a model that has 4 pillars which define an API as RESTful. Follow the example in pratice.

### LEVEL 0

Is defined when the API use HTTP as communication and don't use him with semantic verbs (methods). Example:

```json
http://localhost:8080/produtos
```

### LEVEL 1

The API uses URIs efficiently, maps each resource uniquely and well-defined. In this case, the product resource is well defined. It has more than one URI and defines resources correctly. Remember, in an API, resources are mapped with nouns, not verbs.
</br>
A URI, or Uniform Resource Identifier, is a string of characters that provides a simple and extensible means for identifying a resource. The example below is "`produtos`".

```json
http://localhost:8080/produtos
```

### LEVEL 2

Is when an API uses HTTP for communication and correctly applies HTTP verb semantics (methods). This includes using GET for retrieval, POST for saving, DELETE for removal, and PUT for updates.

### LEVEL 3

When an API uses HTTP, has well-defined resources, applies correct HTTP verb semantics, and uses HATEOAS. HATEOAS provides routes within the API showing resource relationships. If an API meets all these requirements, it can be considered RESTful. For example, inside the nethod GET ALL:

```json
[
{
"idProduto": 8,
"nome": "Samsung $10",
"valor": 4000.00,
    "links": {
    "rel": "self",
    "href": "http://localhost:8080/produtos/8"
    }
},
]
```

`Links` is a implementation of HATEOS inside API, with him it's possible define the relationship of resources and access an specific path with `href` – in the example, some item from `produto` is been access by Id 8.