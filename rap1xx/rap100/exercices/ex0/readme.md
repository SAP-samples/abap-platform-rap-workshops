[Home - RAP100](../../#exercises)

# Exercise 0: Getting Started

## Introduction
---
> **PLEASE NOTE**:    
>  
> Participants of SAP events (e.g. **ABAP Developer Day**) will receive logon information - i.e. system information and user credentials - to a dedicated SAP BTP ABAP Environment system from the SAP team during the respective event.
> >
> Please contact us during the event if you do not find the logon information . 
---
<!--
---
> **WICHTIGE INFORMATION**: 
> 
> Auf dem **ABAP Developer Day 2022** (am 26.06.2022) werden Sie auf einem eigens für die Veranstaltung eingerichteten SAP BTP ABAP Environment (aka Steampunk) System, **D22**, die praktischen Übungen durchführen. In diesem System finden Sie die Lösung der verschiedenen Übungen im Entwicklungspaket **`ZRAP100_SOLUTION`**.   
> 
> Eine E-Mail mit den erforderlichen Benutzerdaten wurde Ihnen vom SAP-Team vor der Veranstaltung zugesandt.  
>
> Bitte kontaktieren Sie uns während der Veranstaltung, falls Sie keine E-Mail erhalten haben. 
---
-->

You've already received user credentials from the SAP Team via email or created an account on the SAP BTP ABAP environment Trial.

You've eventually also created an _ABAP Cloud Project_ in the ABAP Development Tools in Eclipse (ADT). If not, then you will find an appropriate step-b-step description in the section _[Create an ABAP Cloud Project in ADT](#create-an-abap-cloud-project-in-adt)_ below.

<!--
In this exercise you will define a group ID that you will need in the course of this workshop to uniquely identify your repository artefacts and separate them from those of other users conducting the same workshop on this system.
-->

Please note that ADT dialogs and views as well as Fiori UIs may change in upcoming releases.

<!--
- [Requirements](#requirements) 
-->
- [Group ID](#group-id)
- [Create an ABAP Cloud Project in ADT](#create-an-abap-cloud-project-in-adt)
- [Find/Replace](#findreplace)
- [Modern ABAP Syntax](#modern-abap-syntax)
- [Useful ADT Shortcuts](#useful-adt-shortcuts)
- [Summary](#summary)

<!--
## Requirements
[^Top of page](#)

In order to participate in this hands-on session you MUST have installed the latest version of Eclipse and the latest version of the ABAP Development Tools (ADT) in Eclipse.  

Please check the following two short documents how to do this if you have not already done it:  
- [Install the ABAP Development Tools (ADT)](https://github.com/SAP-samples/abap-platform-rap-workshops/blob/main/requirements_rap_workshops.md#3-install-the-abap-development-tools-adt)  
- [Adapt the Web Browser settings in your ADT installation](https://github.com/SAP-samples/abap-platform-rap-workshops/blob/main/requirements_rap_workshops.md#4-adapt-the-web-browser-settings-in-your-adt-installation)  
-->

## Group ID
[^Top of page](#)

Use the group ID assigned to you by the SAP team in the different exercises of this workshop.

<!--
> **PLEASE NOTE**:  
> In case you've been assigned a group ID by the SAP team, then please skip this section (**Group ID**) and go ahead with the next one (**Helpful Information**).
-->

<!--
As the ABAP environment is used by many people, we've defined a naming pattern for each artefact you are going to create to make sure it doesn't conflict with other ones. For this you'll find the placeholder **`###`** used in object names that must be replaced with the group ID of your choice during the exercises. The group ID can contain **a maximum of 3 characters (numbers and/or letters)** - e.g. `000`, `XY1`, or `ABC`. 

You can check for **already used group IDs** by choosing **Open ABAP Development Object** ![open_object_icon](images/adt_open_object.png) or pressing **Ctrl+Shift+A**, and searching for e.g. **`zrap100_*###`**, where **`###`** is your chosen suffix. This lists all artefacts fitting that pattern.  

Try to add e.g. your initials, followed by a number to verify nobody else is already using this group ID.

   ![Group id 01](images/groupid01.png)

_**No results**_ means this group ID seems to be available. You can note it as your group ID somewhere and use it in the next exercises.

Once you've found an available group ID, choose **Cancel**.
-->

> **Note:**    
> The screenshots in this document have been taken using group ID **`000`** and system **`D22`**. We **do not recommend** using group ID `000`.

## Create an ABAP Cloud Project in ADT
[^Top of page](#)

> Create an **ABAP Cloud Project** in your ADT installtion to create a connection to the SAP BTP ABAP Environment system, aka Steampunk.

<details>
  <summary>Click to expand!</summary>
   
1. Open the **ABAP** perspective if not yet done.

    ![Open ABAP Perspective](images/abap_perspective.png)

2. Now create the **ABAP Cloud Project** as shown on the screenshots provided below. 

    ![Create ABAP Project Cloud 1/2](images/steampunk_systemlogon1.png)

    ![Create ABAP Project Cloud 2/2](images/steampunk_systemlogon2.png)

</details>

## Helful Information
[^Top of page](#)

### Find/Replace

In the course of these exercises you will frequently see the task to "_replace the placeholder **`###`** with your group ID_". 

For this it's recommended to make use of the **Find/Replace** feature of the Eclipse Editor. It can be opened either via the menu (**_Edit -> Find/Replace..._**) or via **Ctrl+F**.
  
   ![find and replace](images/find01.png)
   
   Choosing **Replace All** allows you to replace all ocurrences of **`###`** with your group ID.
   
### Modern ABAP Syntax

The modern, declarative, and expression-oriented ABAP language syntax will be used in the different exercises. It allows developers to write more simple and concise source code using new language features like inline declarations, constructor expressions.

> **Find more information in the ABAP Keyword Documentation**: [ABAP - Programming Language](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abenabap_reference.htm) 

### Useful ADT Shortcuts

Here are some useful ADT keyboard shortcuts for the ABAP development in Eclipse.

![ADT Shortcuts](images/adt_shortcuts.png)

More useful ADT shortcuts can be found here: [Link](https://blogs.sap.com/2013/11/21/useful-keyboard-shortcuts-for-abap-in-eclipse/).

> **Info**: You can display the full list of available shortcuts in the **Show Key Assit** in ADT by pressing **Ctrl+Shift+L**.

## Summary 
[^Top of page](#)

You can continue with the next exercise - **[Exercise 1: Create Database Table and Generate UI Service](../ex1/readme.md)**

---
