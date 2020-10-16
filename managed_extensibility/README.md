# RAPCJE - SAP Cloud Platform, ABAP Environment Connectivity and Integration

## Description

This repository contains the material for the ABAP RESTful Application Programming Model workshop:
RAPCJE - SAP Cloud Platform, ABAP Environment Connectivity and Integration. 

## Overview

In this session we will show you how you can use SAP Cloud Platform, ABAP environment for side-by-side extension scenarios with SAP S/4 HANA using the ABAP RESTful Application Programming Model 

 ![Side-by-side extension](images/intro_0020.jpg)

Our scenario is an inventory application that runs on SAP Cloud Platform, ABAP environment. This application will use product master data from an on premise S/4 HANA system that will be retrieved via calling an OData service and via calling a SOAP web service. 

To speed up the development we will use a tool called the RAP Generator that generates the complete stack of a RAP business object based on a table that has to be created beforehand. This allows us to skip writing lots of boiler plate coding that you otherwise would have to write yourself. And we can start much faster with the implementation of our side-by-side integration scenario.

## Requirements

The requirements to follow the exercises in this repository are described [here](../README.md#requirements)

## Exercises

These are the steps of our hands-ons session:

- [Getting Started](exercises/ex0/)
    - [Connect to the system](exercises/ex0#connect-to-the-system)
- [Exercise 1 - Generate a starter application](exercises/ex1#exercise-1)    
    - [Create a package](exercises/ex1#create-a-package)
    - [Create a table](exercises/ex1#create-a-table)
    - [Run the RAP Generator](exercises/ex1#generate-a-starter-application)
    - [Check the generated repository objects](exercises/ex1#check-the-generated-repository-objects)
    - [Behavior Implementation](exercises/ex1#behavior-implementation)
    - [Summary](exercises/ex1#summary)
    
- [Exercise 2 - Consume an OData service](exercises/ex2/exercise-2)
    - [Create the service consumption model](exercises/ex2#create-the-service-consumption-model)
    - [Create a console application to test the OData service](exercises/ex2#create-a-console-application-to-test-the-odata-service)
     - [Create a custom entity and implement the query implementation class](exercises/ex2#create-a-custom-entity-and-implement-the-query-implementation-class)
         - [Create a custom entity](exercises/ex2#create-a-custom-entity)
         - [Implement the query implemenation class](exercises/ex2#implement-the-query-implemenation-class)     
     - [Add the custom entity as a value help](exercises/ex2#add-the-custom-entity-as-a-value-help)
     - [Test the service](exercises/ex2#test-the-service)
     - [Summary](exercises/ex2#summary)   

- [Exercise 3 - Consume a SOAP Web service](exercises/ex3/README.md#exercise-3---consume-a-soap-web-service)
    - [Download the WSDL](exercises/ex3#download-the-wsdl)
    - [Create the Service Consumption Model](exercises/ex3#create-the-service-consumption-model)
    - [Add and implement a determination](exercises/ex3/README.md#add-and-implement-a-determination)
    - [Test the service](exercises/ex3/README.md#test-the-service)

## How to obtain support

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## License
Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
