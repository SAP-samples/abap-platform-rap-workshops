
[Home - RAP110](../../README.md)

# Exercise 13: Explore the Entity Manipulation Language (EML)

## Introduction

🚸
So far, the Entity Manipulation Language (EML) was used in the so-called `IN LOCAL MODE` to implement the transactional behavior of the _Travel_ BO entity in the behavior pool. 

In the previous exercise, you've  (see [Exercise 12](../ex12/readme.md)).

In the present exercise, you will explore how to use EML to consume - i.e. read, update, create, and delete - instances of the _Travel_ BO entity from outside the RAP context. An ABAP class containing sample EML-based access implementations for the _Travel_ BO entity is provided for the purpose. 

This exercise is all about exploring and better understanding EML. Follow the instructions below - and feel free to copy and modify the sample implementations as you like. 

### Exercises:
- [13.1 - Create the ABAP Class](#exercise-91-create-the-abap-class)
- [13.2 - READ a _Travel_ BO Entity Instance](#exercise-92-read-a-travel-bo-entity-instance)
- [13.3 - UPDATE a _Travel_ BO Entity Instance](#exercise-93-update-a-travel-bo-entity-instance)
- [13.4 - CREATE a Travel_ BO Entity Instance](#exercise-94-create-a-travel-bo-entity-instance)
...
- [13.x - Play Around with EML](#exercise-98-play-around-with-eml)
- [Summary](#summary)
- [Appendix](#appendix)


> **Reminder**:     
> Do not forget to replace the suffix placeholder **`###`** with your choosen or assigned group ID in the exercise steps below.   
> Make use of the classic **F1 Help** to get detailed information on each ABAP and EML statement in ABAP editors


## Summary
[^Top of page](#)

🚸

Now that you've played around with various EML statements to 

- deep create
- read function
-
---

- read _Travel_ entity instances,
- update _Travel_ entity instances,
- create new _Travel_ entity instances,
- delete _Travel_ entity instances,
- activate draft _Travel_ entity instances, and 
- discard draft _Travel_ entity instances,

you are done with this hands-on. **Congratulations!**

In this hands-on session, you have learned how to build a simple Fiori elements app with _managed_ implementation type of the ABAP RESTful Application Programming Model (RAP) and how to write a BO test with ABAP Unit, and access BOs outside of the RAP context using the Entity Manipulation Language (EML)!

Thank you for attending this workshop!

## Appendix
[^Top of page](#)

Find the full solution source code of all ![tabl](../images/adt_tabl.png)database tables, CDS artefacts ( ![ddls](../images/adt_ddls.png)views,  ![ddlx](../images/adt_ddlx.png)metadata extensions and  ![bdef](../images/adt_bdef.png)behavior), ![class](../images/adt_class.png) ABAP classes, and ![servicebinding](../images/adt_srvb.png) service definition used in this workshop in the [**sources**](../sources) folder. 
  
Don't forget to replace all occurences of the placeholder `###` in the provided source code with your group ID using the ADT _Replace All_ function (_Ctrl+F_).
