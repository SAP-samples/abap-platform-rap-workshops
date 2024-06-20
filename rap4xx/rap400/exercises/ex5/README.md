# Exercise 5: EML Tests - Write ABAP Unit Tests and mock EML calls

## Introduction

In this exercices we will show how EML calls within you business logic can be mocked. For examples involving a draft scenario, you can check the class `/DMO/TC_BOTD_TRAVEL_D_DEMOS`.  The code under test is consumer methods of the BO `/DMO/I_TRAVEL_M`. 

You will copy the code of this class.

> **Please note:**
> For demonstration purposes there is no logic in code under test other than the EML statement.
> But in real scenarios, there will be additional business logic present in the code under test
> along with the BO dependencies via EML.

A detailed documentation can be found here:
[Managing Dependencies on RAP Business Objects with ABAP Unit](https://help.sap.com/docs/abap-cloud/abap-development-tools-user-guide/managing-dependencies-on-rap-business-objects-with-abap-unit)

## Create test class

1. Open the class `/DMO/TC_BOTD_TRAVEL_M_DEMOS` using **Ctrl+Shift+A**.
2. In the project explorer right click on the class and select **Duplicate** from the context menu.
3. Enter the following values:
   Package: **ZRAP400_TRAVEL_####**
   Name:    **ZTC_BOTD_TRAVEL_M_DEMOS_####**
4. Select or create a new transport
5. Press **Finish**.

## Investigate unit test


