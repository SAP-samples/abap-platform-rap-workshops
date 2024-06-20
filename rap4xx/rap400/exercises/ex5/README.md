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

## Investigate unit test to mock EML API support

1. Open the newly created class  **ZTC_BOTD_TRAVEL_M_DEMOS_####**  
2. Click on the tab **Unit test**  
3. Check the local class `ltcl_mockemlapi_variant_demos`
4. Open the method `isolate_read`. 

![image](https://github.com/SAP-samples/abap-platform-rap-workshops/assets/22053314/a17ffdde-188a-40e1-a63b-2c12605bf61f)

5. Right click on the method `isolate_read` and select **run as Unit test**

6. The result should be a success:

![image](https://github.com/SAP-samples/abap-platform-rap-workshops/assets/22053314/08c31284-5997-42b7-a1f5-6a47e7940061)

7. Now change the code in line 1098

<pre>
  "Step 2: Define and set up the response structures to be returned for Read EML in CUT
    data result type table for read result /DMO/I_TRAVEL_M.
    result = value #( (  Travel_ID = '987' %data-Booking_Fee = 10 Total_Price = 100 Overall_Status = 'A' ) ).

</pre>

such that the input is not searching for a Travel_ID with value `1987`.

<pre>
 "Step 2: Define and set up the response structures to be returned for Read EML in CUT
    data result type table for read result /DMO/I_TRAVEL_M.
    result = value #( (  Travel_ID = '1987' %data-Booking_Fee = 10 Total_Price = 100 Overall_Status = 'A' ) ).
   
</pre>

Do not forget to activate your changes.

8. Run the unit test again and verify that the test now fails.

![image](https://github.com/SAP-samples/abap-platform-rap-workshops/assets/22053314/92afcf9f-1dd4-4bc6-ab5a-41bcb7e1318a)

 


