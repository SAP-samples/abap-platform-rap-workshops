[Home - RAP100](../../#exercises)

# Exercise 3: Enhance the BO Behavior – Early Numbering  

## Introduction 

In the previous exercise, you've enhanced the data model of the business object (BO) entity _Travel_ (see [Exercise 2](../ex2/readme.md)).

In the present exercise, you will define and implement the _unmanaged internal early numbering_ to set the primary key `TravelID` of new _Travel_ instances during their creation in your application. You will also use the static field control to specify some fields to read-only.    
A number range object will be used to determine the unique travel identifiers.
 
- [3.1 - Define the Internal Early Numbering](#exercise-31-define-the-internal-early-numbering)
- [3.2 - Implement the Internal Early Numbering](#exercise-32-implement-the-internal-early-numbering)
- [3.3 - Preview and Test the Enhanced Travel App](#exercise-33-preview-and-test-the-enhanced-travel-app)
- [Summary](#summary)  
- [Appendix](#appendix)  

> **Reminder**: Do not forget to replace the suffix placeholder **`###`** with your choosen or assigned group ID in the exercise steps below. 

### Excursus: Numbering  

> Numbering is about setting values for primary key fields of entity instances during runtime. Different types of numbering are supported in RAP which can be divided into two main categories: 
> - **Early numbering**: In an early numbering scenario, the primary key value is set instantly after the modify request for the `CREATE` is executed. The key values can be passed externally by the consumer or can be set internally by the framework or an implementation of the `FOR NUMBERING` method. The latter will be implemented in the present exercise.
> - **Late numbering**: In a late numbering scenario, the key values are always assigned internally without consumer interaction after the point of no return in the interaction phase has passed, and the `SAVE` sequence is triggered. 
> 
> **Further reading**: [Numbering](https://help.sap.com/viewer/923180ddb98240829d935862025004d6/Cloud/en-US/d85aec25222145f0b0cbbe8b02db51f0.html)

## Exercise 3.1: Define the internal Early Numbering 
[^Top of page](#)

> Define the (unmanaged) internal early numbering in the behavior definition ![bdef icon](images/adt_bdef.png) of the _Travel_ entity.

 <details>
  <summary>Click to expand!</summary>

1. Open the behavior definiton ![bdef icon](images/adt_bdef.png)**`ZRAP100_R_TravelTP_###`** of the _Travel_ entity.

2. Specify the statement provided below just after the statement `authorization master( global )`, just before the opening curly bracket `{` as shown on the screenshot. 

   ```ABAP
   early numbering
   ```

   The warning message _`Early Numbering for CREATE ZRAP100_R_TRAVELTP_### is not implemented`_ is now displayed for the statement **`create;`**.   
   You can hover the yellow underlined statement to display the message or have a look at the **Problems** view.        
   
   You can ignore it for now. You will handle it later.    

   <!-- ![Travel BO Behavior Definition](images/new7.png) -->
   <img src="images/new7.png" alt="BO Behavior Definition" width="60%">
   
   As you can seen in the behavior definition, the administrative fields `CreatedAt`, `CreatedBy`, `LocalLastChangedAt`, `LastChangedAt`, and    `LastChangedBy` have   
   been set to read-only during the service generation. Their values are automatically set by the ABAP runtime thanks to element annotations specified in the base CDS 
   view entity ![ddls icon](images/adt_ddls.png)`ZRAP100_R_Travel_###`.  
 
   The _Travel_ BO uses the early numbering in this scenario. To ensure that the primary key field `TravelID` is filled when creating new _travel_ instances, but is 
   read-only on further processing of these instances, the operation-dependent field access restrictions `field (mandatory:create)` and `field (read-only:update)` are 
   used respectively.

3. Specify the field **`TravelID`** as read-only field since it will be set at runtime by the internal early numbering. 
   
   > **Info**: The **static field control** is used to restrict properties of particular fields. 
   
   For that, replace the statement   
 
   <!-- ```ABAP
   field ( mandatory : create )
   TravelID;
   ```
   
   with the code snippet provided below in the behavior definition as shown on the screenshot.  
  
   ```ABAP
   field ( readonly : update )
   TravelID;
   ```  !-->
 
   ```ABAP
   field ( readonly )
   TravelID;
   ```
  
   You can use the **ABAP Pretty Printer** function (**Shift+F1**) to format the source code.  

   <!--  ![Travel BO Behavior Definition](images/field.png)   !-->

 <img src="images/field.png" alt="Travel BO Behavior Definition" width="60%"> 
 
   As you can seen in the behavior definition, the administrative fields `CreatedAt`, `CreatedBy`, `LocalLastChangedAt`, `LastChangedAt`, and `LastChangedBy` have been set to read-only during the service generation. Their values are automatically set by the ABAP runtime thanks to element annotations specified in the base CDS view entity ![ddls icon](images/adt_ddls.png)`ZRAP100_R_Travel_###`.  
 

   
4. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.
   
5. To complete the definition, you need to declare the required method in behavior implementation class. You can use the ADT Quick Fix to do that.
     
   Set the cursor on the statement **`create;`** and press **Ctrl+1** to open the **Quick Assist** view. 
   
   Select the entry **`Add earlynumbering method for create of entity zrap100_i_travel_### in local handler ...`** from the dialog to add the `FOR NUMBERING` method **`earlynumbering_create`** to the local handler class **`lcl_handler`** of the behavior pool ![class icon](images/adt_class.png)**`ZRAP100_BP_TRAVELTP_###`**.
         
   <!-- ![Travel BO Behavior Definition](images/create.png) -->
   <img src="images/create.png" alt="Travel BO Behavior Definition" width="60%">  
   
   The behavior implementation class ![class icon](images/adt_class.png)**`ZRAP100_BP_TRAVEL_###`** will be enhanced appropriately.
   
   You are through with the definition of the early numbering and can now go ahead and implement its logic.     

6. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.

</details>

## Exercise 3.2: Implement the Internal Early Numbering 
[^Top of page](#)

> You will now implement the logic for the unmanaged internal early numbering in behavior implementation class (aka behavior pool) ![class icon](images/adt_class.png)**`ZRAP100_BP_TRAVELTP_###`** of the _Travel_ BO entity. A number range object will be used to determine the IDs of new _Travel_ BO entity instances.

> **Please note**:  
> Due to time constraints (and simplification reasons), the proper error handling when using number ranges is not part of this implementation example. 
> Nevertheless, you can find a more comprehensive implementation example of a managed BO with a number range object in the behavior implementation class `/DMO/BP_TRAVEL_M` located in the package `/DMO/FLIGHT_MANAGED`. A description of this implementation is provided in the RAP development guide [Developing Managed Transactional Apps](https://help.sap.com/viewer/923180ddb98240829d935862025004d6/Cloud/en-US/b5bba99612cf4637a8b72a3fc82c22d9.html) on the SAP Help Portal.

 <details>
  <summary>Click to expand!</summary>
   
1. Check the method interface of the method **`earlynumbering_create`** in the declaration part of the local handler class `lcl_handler`.  
   
   For that, set the cursor on the method name and press **F2** to open the **ABAP Element Info** view and examine the full method interface, for example, the importing and changing parameters. You can navigate to the different (derived) types.
  
   ![Travel BO Behavior Pool](images/new10.png)
   
   
   > Signature of the `FOR NUMBERING` method for managed BOs:
   > - `IMPORTING`parameter **`entities`** - includes all entities for which keys must be assigned 
   > - Implicit `CHANGING` parameters (return paramters):   
   >    - **`mapped`** - used to provide the consumer with ID mapping information 
   >    - **`failed`** - used for identifying the data set where an error occurred   
   >    - **`reported`** - used to return messages in case of failure.     
   >
   > **Further reading**: [Implicit Response Parameters](https://help.sap.com/viewer/fc4c71aa50014fd1b43721701471913d/202110.000/en-US/aceaf8453d4b4e628aa29aa7dfd7d948.html)               
  
2. Now go ahead and implement the method **`earlynumbering_create`** in the implementation part of the implementation class.
   
   First, it must be ensured that the imported _Travel_ entity instances do not yet have an ID set. This must especially be checked when the BO is draft-enabled. 
   
   For that, remove all instances with a non-initial **`TravelID`** from the imported parameter **`entities`** which contains all _Travel_ entities for which a key must be assigned. Insert the code snippet provided below into the method implementation and replace all occurrences of the placeholder `###` with your group ID.

   ```ABAP
    DATA:
      entity           TYPE STRUCTURE FOR CREATE ZRAP100_R_TravelTP_###,
      travel_id_max    TYPE /dmo/travel_id,
      " change to abap_false if you get the ABAP Runtime error 'BEHAVIOR_ILLEGAL_STATEMENT'
      use_number_range TYPE abap_bool VALUE abap_true.

    "Ensure Travel ID is not set yet (idempotent)- must be checked when BO is draft-enabled
    LOOP AT entities INTO entity WHERE TravelID IS NOT INITIAL.
      APPEND CORRESPONDING #( entity ) TO mapped-travel.
    ENDLOOP.

    DATA(entities_wo_travelid) = entities.
    "Remove the entries with an existing Travel ID
    DELETE entities_wo_travelid WHERE TravelID IS NOT INITIAL.
   ```
 
   ![Travel BO Behavior Pool](images/new11.png)
   
3. Use the Number Range API to retrieve the set of available numbers, based on entries in **`entities_wo_travelid`** and determine the first available travel ID. 

   The number range object **`/DMO/TRV_M`** of the _ABAP Flight Reference Scenario_ (located in the package `/DMO/FLIGHT_REUSE`) is used in the example implementation provided below.

   > **Please note**: All participants are using the same number range object **`/DMO/TRV_M`**, therefore, the assigned Travel ID will not be gap-free.
   
   For that, enhance the method implementation with the provided code snippet as shown on the screenshot below. As already mentioned, the error handling is kept to the minimum here.

   ```ABAP 
     IF use_number_range = abap_true.
      "Get numbers
      TRY.
          cl_numberrange_runtime=>number_get(
            EXPORTING
              nr_range_nr       = '01'
              object            = '/DMO/TRV_M'
              quantity          = CONV #( lines( entities_wo_travelid ) )
            IMPORTING
              number            = DATA(number_range_key)
              returncode        = DATA(number_range_return_code)
              returned_quantity = DATA(number_range_returned_quantity)
          ).
        CATCH cx_number_ranges INTO DATA(lx_number_ranges).
          LOOP AT entities_wo_travelid INTO entity.
            APPEND VALUE #(  %cid      = entity-%cid
                             %key      = entity-%key
                             %is_draft = entity-%is_draft
                             %msg      = lx_number_ranges
                          ) TO reported-travel.
            APPEND VALUE #(  %cid      = entity-%cid
                             %key      = entity-%key
                             %is_draft = entity-%is_draft
                          ) TO failed-travel.
          ENDLOOP.
          EXIT.
      ENDTRY.

      "determine the first free travel ID from the number range
      travel_id_max = number_range_key - number_range_returned_quantity.
    ELSE.
      "determine the first free travel ID without number range
      "Get max travel ID from active table
      SELECT SINGLE FROM zrap100_atrav### FIELDS MAX( travel_id ) AS travelID INTO @travel_id_max.
      "Get max travel ID from draft table
      SELECT SINGLE FROM zrap100_dtrav### FIELDS MAX( travelid ) INTO @DATA(max_travelid_draft).
      IF max_travelid_draft > travel_id_max.
        travel_id_max = max_travelid_draft.
      ENDIF.
    ENDIF.
 
   ```
   
   ![Travel BO Behavior Pool](images/new12.png)
 

> ⚠ If you get the following error message:  
> **ABAP Runtime error 'BEHAVIOR_ILLEGAL_STATEMENT'**    
> then change the value of the variable `use_number_range` to `abap_false`.   
> `use_number_range TYPE abap_bool VALUE abap_true.`     
 
4. Set the Travel ID for new _Travel_ instances without identifier.
   
   Enhance the method implementation with the following code snippet as shown on the screenshot below.

   ```ABAP 
    "Set Travel ID for new instances w/o ID
    LOOP AT entities_wo_travelid INTO entity.
      travel_id_max += 1.
      entity-TravelID = travel_id_max.

      APPEND VALUE #( %cid      = entity-%cid
                      %key      = entity-%key
                      %is_draft = entity-%is_draft
                    ) TO mapped-travel.
    ENDLOOP.  
   ```

   Remember to regularly use the **ABAP Pretty Printer** function (**Shift+F1**) to format your source code.
   
   ![Travel BO Behavior Pool](images/new13.png)

5. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.

</details>

## Exercise 3.3: Preview and Test the Enhanced Travel App 
[^Top of page](#)

> You can now preview and test the changes by creating a new travel instance in the Travel app.

 <details>
  <summary>Click to expand!</summary>

1. Refresh your application in the browser using **F5** if the browser is still open -   
   or go to your service binding ![srvb icon](images/adt_srvb.png)**`ZRAP100_UI_TRAVEL_O4_###`** and start the Fiori elements App preview for the **`Travel`** entity set.

2. Create a new _Travel_ instance. 

   ![Travel App Preview](images/preview2.png)  

   No dialog for manually entering a Travel ID should be displayed now. The Travel ID will be assigned automatically by the logic you just implemented.   

   ![Travel App Preview](images/preview3.png)  

</details>


## Summary
[^Top of page](#)

Now that you've... 
- defined the early numbering and the static feature control, 
- implement the early numbering, and
- preview and test the enhanced Fiori elements app,

you can continue with the next exercise – **[Exercise 4: Enhance the BO Behavior – Determinations](../ex4/readme.md)**

---

## Appendix
[^Top of page](#)

Find the source code for the behavior definition and behavior implementation class (aka behavior pool) of the _Travel_ entity in the [sources](sources) folder. Don't forget to replace all occurences of the placeholder `###` with your group ID.

- ![document](images/doc.png) [CDS BDEF ZRAP100_R_TRAVELTP_###](sources/EX3_BDEF_ZRAP100_R_TRAVELTP.txt)
- ![document](images/doc.png) [Class ZRAP100_BP_TRAVELTP_###](sources/EX3_CLASS_ZRAP100_BP_TRAVELTP.txt)
