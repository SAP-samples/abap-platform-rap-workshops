[Home - RAP Managed BO Runtime Implementation](../readme.md)

# RAP100 - Build Fiori Apps with the ABAP RESTful Application Programming Model (RAP)

## Description

This repository contains the material for the hands-on session **RAP100 - Building Fiori Apps with the ABAP RESTful application Programming Model (RAP)**.

- [Requirements for attending this workshop](#requirements-for-attending-this-workshop)
- [Overview](#overview)
- [About the ABAP RESTful Application Programming Model (RAP)](#about-the-abap-restful-application-programming-model)
- [Exercises](#exercises)
- [Related Tutorials](#related-tutorials)
- [How to obtain support](#how-to-obtain-support)
- [Further Information](#further-information)


## Requirements for attending this workshop 
[^Top of page](#)

> In order to participate in this hands-on session, you **MUST** have installed the latest version of Eclipse and the latest version of the ABAP Development Tools (ADT) in Eclipse.   
> Please check the following two short documents how to do this if you have not already done it:  
> - [Install the ABAP Development Tools (ADT)](https://github.com/SAP-samples/abap-platform-rap-workshops/blob/main/requirements_rap_workshops.md#3-install-the-abap-development-tools-adt)  
> - [Adapt the Web Browser settings in your ADT installation](https://github.com/SAP-samples/abap-platform-rap-workshops/blob/main/requirements_rap_workshops.md#4-adapt-the-web-browser-settings-in-your-adt-installation)  

## Overview

This workshop is all about RAP fundamentals; especially about how to use RAP core features when building greenfield implementations.

In this hands-on session we will guide you through the development of the OData service of a SAP Fiori elements based _Travel Processng App_ with RAP, using the _managed_ business object (BO) runtime implementation with semantic key and internal unmanaged early numbering. We will give you more details on the scenario in the different exercises.

The resulting app will look like this:

![Travel App](images/travelapp01.png)

The Fiori elements bases _Travel_ app you are going to implement is based on the _ABAP Flight Reference Scenario_. To set the business context, the scenario is the following: The department responsible for managing worldwide Travels for multiple Agencies is requesting you to build a new Fiori app with draft capabilities for processing (i.e. creating, updating and deleting) Travels.

Below is the simplified data model underlying the app.

![Travel App](images/datamodel01.png)


> **Please note**:   
> The purpose of the different exercises is to show you how to implement the different RAP core features - and less on having the perfect business scenario.
> To remove a certain complexity in the implementation, we will use a very simplified data model with only one BO node, the _Travel_ entity.   
> For implementation examples with more than one BO node, you can have a look at:
> - Workshop **[DEV260](../readme.md)**
> - RAP Development Guide on the SAP Help Portal: **[Develop Applications](https://help.sap.com/viewer/923180ddb98240829d935862025004d6/Cloud/en-US/4cff5dff7f2642cab54e993c840a163e.html)**

## About the ABAP RESTful Application Programming Model
[^Top of page](#)

The ABAP RESTful Application Programming Model (RAP) is a set of concepts, tools, languages, and powerful frameworks provided on the ABAP platform. It supports the efficient development of innovative and cloud-ready enterprise applications, as well as the extension of SAP standard applications in an upgrade-stable way in the cloud and on-premise.

RAP is an enabler for improving the user experience and innovating business processes in ABAP-based SAP solutions by leveraging SAP Fiori, SAP HANA, and the Cloud. It is a long-term strategic solution for ABAP development on SAP’s flagship product SAP S/4HANA, cloud and on-premise (as of release 1909) editions, as well as on the SAP BTP ABAP Environment.

> **Read more**: [Modernization with RAP](https://blogs.sap.com/2021/10/18/modernization-with-rap/)

The illustration below shows the high-level end-to-end development stack when working with RAP.  

![RAP Big Picture](images/rap_bigpicture.png)

## Exercises
[^Top of page](#)

Follow these steps to build a RAP-based simple App with a helper class and write various ABAP unit tests for it.

| Exercises |  Estimated time |
| ------------- |  -- |
| [Getting Started](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex0/) | -- |
| [Exercise 1: Create Database Table and Generate UI Service](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex1/readme.md) | -- |
| [Exercise 2: Enhance the BO Data Model](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex2/readme.md) | -- |
| [Exercise 3: Enhance the BO Behavior – Numbering](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex3/readme.md) | -- |
| [Exercise 4: Enhance the BO Behavior – Determinations](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex4/readme.md) | -- |
| [Exercise 5: Enhance the BO Behavior – Validations](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex5/readme.md) | -- |
| [Exercise 6: Enhance the BO Behavior – Actions ](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex6/readme.md) | -- |
| [Exercise 7: Enhance the BO Behavior – Dynamic Feature Control (optional)](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex7/readme.md) | -- |
| [Exercise 8: ABAP Unit Testing with the Entity Manipulation Language (optional)](https://github.com/SAP-samples/abap-platform-rap-workshops/tree/main/rap1xx/rap100/exercices/ex8/readme.md) | -- |


## How to obtain support
[^Top of page](#)

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## Further Information
[^Top of page](#)

You can find further information on the ABAP RESTful Application Programming Model (RAP) here:
 - [Get Started with the ABAP RESTful Application Programming Model](https://blogs.sap.com/2019/10/25/getting-started-with-the-abap-restful-programming-model) - A collection of diverse getting started materials.   
 - Free openSAP course [Building Apps with the ABAP RESTful Application Programming Model](https://community.sap.com/topics/btp-abap-environment/rap-opensap) ([direct link](https://open.sap.com/courses/cp13) to the course) 
 - [Modernization with RAP](https://blogs.sap.com/2021/10/18/modernization-with-rap/)
 - Most frequently asked questions: [RAP FAQ](https://blogs.sap.com/2020/10/16/abap-restful-application-programming-model-faq/) 
 - SAP Fiori: [Develop and Run a Fiori Application with SAP Business Application Studio (optional)](https://developers.sap.com/tutorials/abap-environment-deploy-cf-production.html) 

## License
Copyright (c) 2022 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.

