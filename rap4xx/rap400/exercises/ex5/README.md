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

![image](https://github.com/SAP-samples/abap-platform-rap-workshops/assets/22053314/0b1ab449-9b82-4537-85c7-c1972fbb6280)

5. Right click on the method `isolate_read` and select **run as Unit test**



6. The result should be a success:

![image](https://github.com/SAP-samples/abap-platform-rap-workshops/assets/22053314/8f488161-1f74-4ddf-9288-bebbb75e04ea)

7. Now change the code in line 1095

<pre>
    read_travel_instances = value #( (  Travel_ID = '987' ) "travel returned
                                     (  Travel_ID = '988' ) ). "read should fail for 988 assuming the instance does not exist

</pre>

such that the input is not searching for a Travel_ID with value `1987`.

Do not forget to activate your changes.

8. Run the unit test again and verify that the test now fails.

![image](https://github.com/SAP-samples/abap-platform-rap-workshops/assets/22053314/1c616e68-b834-4869-85af-57be1cf0a8e0)

 


