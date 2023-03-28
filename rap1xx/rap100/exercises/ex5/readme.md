[Home - RAP100](../../#exercises)

# Exercise 5: Enhance the BO Behavior – Validations 

## Introduction 

In the previous exercise, you've defined and implemented a determination for setting the inital value of the field `OverallStatus` to `Open` (`O`) during the creation of new instances of BO entity _Travel_ (see [Exercise 4](../ex4/readme.md)).

In the present exercise, you're going to define and implement two back-end validations, `validateCustomer` and `validateDates`, to respectively check if the customer ID that is entered by the consumer is valid and if the begin date is in the future and if the value of the end date is after the begin date. These validations are only performed in the back-end (not on the UI) and are triggered independently of the caller, i.e. Fiori UIs or EML APIs.

> ℹ **Frontend validation & Backend validations**     
> Validations are used to ensure the data consistency.   
> As the name suggests, **frontend validations** are performed on the UI. They are used to improve the user experience by providing faster feedback and avoiding unnecessary roundtrips. In the RAP context, front-end validations are defined using CDS annotation or UI logic.  
> On the other hand, **backend validations** are performed on the back-end. They are defined in the BO behavior definitons and implemented in the respective behavior pools.   
> Frontend validations can be easily bypassed - e.g. by using EML APIs in the RAP context. Therefore, **backend validations are a MUST** to ensure the data consistency.

- [5.1 - Define the Validation `validateCustomer` and `validateDates`](#exercise-51-define-the-validations-validatecustomer-and-validatedates)
- [5.2 - Implement the Validation `validateCustomer`](#exercise-52-implement-the-validation-validatecustomer)
- [5.3 - Implement the Validation `validateDates`](#exercise-53-implement-the-validation-validatedates)
- [5.4 - Preview and Test the enhanced Travel App](#exercise-54-preview-and-test-the-enhanced-travel-app)
- [Summary](#summary)  
- [Appendix](#appendix)

> **Reminder**: Do not forget to replace the suffix placeholder **`###`** with your choosen or assigned group ID in the exercise steps below. 

### About Validations

A validation is an optional part of the business object behavior that checks the consistency of business object instances based on trigger conditions. 

A validation is implicitly invoked by the business object’s framework if the trigger condition of the validation is fulfilled. Trigger conditions can be `MODIFY` operations and modified fields. The trigger condition is evaluated at the trigger time, a predefined point during the BO runtime. An invoked validation can reject inconsistent instance data from being saved by passing the keys of failed instances to the corresponding table in the `FAILED` structure. Additionally, a validation can return messages to the consumer by passing them to the corresponding table in the `REPORTED` structure.

> **Further reading**: [Validations](https://help.sap.com/viewer/923180ddb98240829d935862025004d6/Cloud/en-US/171e26c36cca42699976887b4c8a83bf.html)

## Exercise 5.1: Define the Validations `validateCustomer` and `validateDates`
[^Top of page](#)

> Define the validations `validateCustomer` and `validateDates`.  

 <details>
  <summary>Click to expand!</summary>
  
1. Open your behavior definition ![behaviordefinition](images/adt_bdef.png) **`ZRAP100_R_TRAVELTP_###`**  

2. Because empty values will not be accepted for the fields **`CustomerID`**, **`BeginDate`**, and **`EndDate`**, specify them as _mandatory_ field 
   by adding the following code snippet after the determination as shown on the screenshot below.
 
   <pre lang="ABAP">  
    field ( mandatory )
    CustomerID,
    BeginDate,
    EndDate;  
   </pre>   

   Your source code should look like this:   

   <!-- ![validation](images/new18a.png)    -->
   <img src="images/new18a.png" alt="validation" width="60%"> 

3. Define the validations **`validateCustomer`** and **`validateDates`**.
     
   For that, add the following code snippet after the determination as shown on the screenshot below.
   
   <pre lang="ABAP"> 
   validation validateCustomer on save { create; field CustomerID; }
   validation validateDates on save { create; field BeginDate, EndDate; }
   </pre>          

4. In order to have draft instances being checked by validations and determinations being executed before they become active, they have to be specified for the **`draft determine action prepare`** in the behavior definition.
  
   Replace the code line **`draft determine action Prepare;`** with the following code snippet as shown on the screenshot below

   <pre lang="ABAP"> 
   draft determine action Prepare
   {
   validation validateCustomer;
   validation validateDates;    }
   </pre>     
     
   Your source code should look like this: 
   
   <!-- ![validation](images/new18.png) -->
   <img src="images/new18.png" alt="validation" width="60%">       
     
   **Short explanation**:    
   - Validations are always invoked during the save and specified with the keyword `validateCustomer on save`.    
   - `validateCustomer` is a validation with trigger operation `create` and trigger field `CustomerID`.    
   - `validateDates` is a validation with trigger operation `create` and trigger fields `BeginDate` and `EndDate`.            
    
   **ℹ Hint**:    
   > In case a validation should be invoked at every change of the BO entity instance, then the trigger conditions `create`and `update` 
   > must be specified: e.g. `validation validateCustomer on save { create; update; }`
 
5. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.
      
6. Add the appropriate **`FOR VALIDATE ON SAVE`** methods to the local handler class of the behavior pool of the _Travel_ BO entity via quick fix.  
   
   For that, set the cursor on one of the validation names and press **Ctrl+1** to open the **Quick Assist** view and select the entry _**`Add all 2 missing methods of entity zrap100_r_travel_### ...`**_.
   
   As a result, the **`FOR VALIDATE ON SAVE`** methods **`validateCustomer`** and **`validateDates`** will be added to the local handler class `lcl_handler` of the behavior pool of the _Travel_ BO entity ![class icon](images/adt_class.png)`ZRAP100_BP_TRAVELTP_###`.       
   
   <!-- ![Travel BO Behavior Pool](images/new19.png)  -->
   <img src="images/new19.png" alt="validation" width="90%">   

7. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.

> Hint:  
> If you get an error message in the behavior implementation `The entity "ZRAP100_R_TRAVELTP_###" does not have a validation "VALIDATECUSTOMER".` try to activate the behvavior definition once again.  

</details>
  
## Exercise 5.2: Implement the Validation `validateCustomer` 
[^Top of page](#)

> Implement the validation `validateCustomer` which checks if the customer ID (`CustomerID`) that is entered by the consumer is valid.   
> An appropriate message should be raised and displayed on the UI for each invalid value.

 <details>
  <summary>Click to expand!</summary>

1. First, check the interface of the new methods in the declaration part of the local handler class `lcl_handler` of the behavior pool of the _Travel_ BO entity ![class icon](images/adt_class.png)**`ZRAP100_BP_TRAVELTP_###`**. 

   For that, set the cursor on the method name, **`validateCustomer`**, press **F2** to open the **ABAP Element Info** view, and examine the full method interface. 
   
   ![Travel BO Behavior Pool](images/v3.png)  
   
   **Short explanation**:  
   - The addition **`FOR VALIDATE ON SAVE`** indicates that the method provides the implementation of a validation executed on save. Validations are always executed on save.   
   -  Method signature for the validation method:
     - `IMPORTING`parameter **`keys`** - an internal table containing the keys of the instances on which the validation should be performed.
     - Implicit `CHANGING` parameters (aka _implicit response parameters_):  
       - **`failed`**   - table with information for identifying the data set where an error occurred
       - **`reported`** - table with data for instance-specific messages
      
   You can go ahead and implement the validation method.

2. Now implement the method **`validateCustomer`** in the implementation part of the class.
   
    The logic consists of the following main steps:   
    1. Read the travel instance(s) of the transferred keys (**`keys`**) using the EML statement **`READ ENTITIES`**.   
    2. The addition **`FIELDS`** is used to specify the fields to be read. Only **`CustomerID`** is relevant for the present validation.  
       The addition `ALL FIELDS` can be used to read all fields.
    3. The addition **`IN LOCAL MODE`** is used to exclude feature controls and authorization checks.
    4. Read all the transfered (distinct, non-initial) customer IDs and check if they exist.  
    5. Prepare/raise messages for all transferred _travel_ instances with initial and non-existing customer ID (**`CustomerID`**)  
       and set the changing parameter **`reported`**   

   Replace the current method implementation of **`validateCustomer`** with following code snippet and replace all occurrences of the placeholder **`###`** with your group ID. 
   
   You can use the **F1 Help** to get detailed information on the different ABAP and EML statements.  
 
   ```ABAP
   **********************************************************************
   * Validation: Check the validity of the entered customer data
   **********************************************************************
     METHOD validateCustomer.
       "read relevant travel instance data
       READ ENTITIES OF ZRAP100_R_TravelTP_### IN LOCAL MODE
       ENTITY Travel
        FIELDS ( CustomerID )
        WITH CORRESPONDING #( keys )
       RESULT DATA(travels).

       DATA customers TYPE SORTED TABLE OF /dmo/customer WITH UNIQUE KEY customer_id.

       "optimization of DB select: extract distinct non-initial customer IDs
       customers = CORRESPONDING #( travels DISCARDING DUPLICATES MAPPING customer_id = customerID EXCEPT * ).
       DELETE customers WHERE customer_id IS INITIAL.
       IF customers IS NOT INITIAL.

         "check if customer ID exists
         SELECT FROM /dmo/customer FIELDS customer_id
                                   FOR ALL ENTRIES IN @customers
                                   WHERE customer_id = @customers-customer_id
           INTO TABLE @DATA(valid_customers).
       ENDIF.

       "raise msg for non existing and initial customer id
       LOOP AT travels INTO DATA(travel).

         APPEND VALUE #(  %tky                 = travel-%tky
                          %state_area          = 'VALIDATE_CUSTOMER'
                        ) TO reported-travel.

         IF travel-CustomerID IS  INITIAL.
           APPEND VALUE #( %tky = travel-%tky ) TO failed-travel.

           APPEND VALUE #( %tky                = travel-%tky
                           %state_area         = 'VALIDATE_CUSTOMER'
                           %msg                = NEW /dmo/cm_flight_messages(
                                                                   textid   = /dmo/cm_flight_messages=>enter_customer_id
                                                                   severity = if_abap_behv_message=>severity-error )
                           %element-CustomerID = if_abap_behv=>mk-on
                         ) TO reported-travel.

         ELSEIF travel-CustomerID IS NOT INITIAL AND NOT line_exists( valid_customers[ customer_id = travel-CustomerID ] ).
           APPEND VALUE #(  %tky = travel-%tky ) TO failed-travel.

           APPEND VALUE #(  %tky                = travel-%tky
                            %state_area         = 'VALIDATE_CUSTOMER'
                            %msg                = NEW /dmo/cm_flight_messages(
                                                                   customer_id = travel-customerid
                                                                   textid      = /dmo/cm_flight_messages=>customer_unkown
                                                                   severity    = if_abap_behv_message=>severity-error )
                            %element-CustomerID = if_abap_behv=>mk-on
                         ) TO reported-travel.
         ENDIF.

       ENDLOOP.
     ENDMETHOD.      
   ```
  
3. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.

</details>

## Exercise 5.3: Implement the Validation `validateDates` 
[^Top of page](#)

> Implement the validation `validateDates` which checks the validity of entered begin dates (`BeginDate`) and end dates (`EndDate`). 
> An appropriate messages should be raised and displayed on the UI for each invalid value.

 <details>
  <summary>Click to expand!</summary>

1. In your implementation class ![class](images/adt_class.png) **`ZRAP100_BP_TRAVELTP_###`**, replace the current method implementation of **`validateDates`** with following code snippet and replace all occurrences of the placeholder **`###`** with your group ID.

   The main implementation steps are similar to the one of method **`validateCustomer`**. 
 
   This validation is performed on the fields **`BeginDate`** and **`EndDate`**. It checks if the entered begin date (`BeginDate`) is in the future and if the value of the entered end date (`EndDate`) is after the begin date (`BeginDate`).   
 
 <```ABAP
 **********************************************************************
 * Validation: Check the validity of begin and end dates
 **********************************************************************
   METHOD validateDates.

     READ ENTITIES OF ZRAP100_R_TravelTP_### IN LOCAL MODE
       ENTITY Travel
         FIELDS (  BeginDate EndDate TravelID )
         WITH CORRESPONDING #( keys )
       RESULT DATA(travels).

     LOOP AT travels INTO DATA(travel).

       APPEND VALUE #(  %tky               = travel-%tky
                        %state_area        = 'VALIDATE_DATES' ) TO reported-travel.

       IF travel-BeginDate IS INITIAL.
         APPEND VALUE #( %tky = travel-%tky ) TO failed-travel.

         APPEND VALUE #( %tky               = travel-%tky
                         %state_area        = 'VALIDATE_DATES'
                          %msg              = NEW /dmo/cm_flight_messages(
                                                                 textid   = /dmo/cm_flight_messages=>enter_begin_date
                                                                 severity = if_abap_behv_message=>severity-error )
                         %element-BeginDate = if_abap_behv=>mk-on ) TO reported-travel.
       ENDIF.
       IF travel-BeginDate < cl_abap_context_info=>get_system_date( ) AND travel-BeginDate IS NOT INITIAL.
         APPEND VALUE #( %tky               = travel-%tky ) TO failed-travel.

         APPEND VALUE #( %tky               = travel-%tky
                         %state_area        = 'VALIDATE_DATES'
                          %msg              = NEW /dmo/cm_flight_messages(
                                                                 begin_date = travel-BeginDate
                                                                 textid     = /dmo/cm_flight_messages=>begin_date_on_or_bef_sysdate
                                                                 severity   = if_abap_behv_message=>severity-error )
                         %element-BeginDate = if_abap_behv=>mk-on ) TO reported-travel.
       ENDIF.
       IF travel-EndDate IS INITIAL.
         APPEND VALUE #( %tky = travel-%tky ) TO failed-travel.

         APPEND VALUE #( %tky               = travel-%tky
                         %state_area        = 'VALIDATE_DATES'
                          %msg                = NEW /dmo/cm_flight_messages(
                                                                 textid   = /dmo/cm_flight_messages=>enter_end_date
                                                                 severity = if_abap_behv_message=>severity-error )
                         %element-EndDate   = if_abap_behv=>mk-on ) TO reported-travel.
       ENDIF.
       IF travel-EndDate < travel-BeginDate AND travel-BeginDate IS NOT INITIAL
                                            AND travel-EndDate IS NOT INITIAL.
         APPEND VALUE #( %tky = travel-%tky ) TO failed-travel.

         APPEND VALUE #( %tky               = travel-%tky
                         %state_area        = 'VALIDATE_DATES'
                         %msg               = NEW /dmo/cm_flight_messages(
                                                                 textid     = /dmo/cm_flight_messages=>begin_date_bef_end_date
                                                                 begin_date = travel-BeginDate
                                                                 end_date   = travel-EndDate
                                                                 severity   = if_abap_behv_message=>severity-error )
                         %element-BeginDate = if_abap_behv=>mk-on
                         %element-EndDate   = if_abap_behv=>mk-on ) TO reported-travel.
       ENDIF.
     ENDLOOP.

   ENDMETHOD. 
 ``` 
 
 ```ABAP 
 **********************************************************************
 * Validation: Check the validity of begin and end dates
 **********************************************************************
   METHOD validateDates.
     READ ENTITIES OF ZRAP100_R_TravelTP_### IN LOCAL MODE
       ENTITY travel
         FIELDS ( BeginDate EndDate )
         WITH CORRESPONDING #( keys )
       RESULT DATA(lt_travel_result).

     LOOP AT lt_travel_result INTO DATA(ls_travel_result).

       IF ls_travel_result-EndDate < ls_travel_result-BeginDate.  "if end_date is before begin_date

         APPEND VALUE #( %key        = ls_travel_result-%key
                         travelID    = ls_travel_result-TravelID ) TO failed-travel.

         APPEND VALUE #( %key = ls_travel_result-%key
                         %msg     = new_message( id       = /dmo/cx_flight_legacy=>end_date_before_begin_date-msgid
                                                 number   = /dmo/cx_flight_legacy=>end_date_before_begin_date-msgno
                                                 v1       = ls_travel_result-BeginDate
                                                 v2       = ls_travel_result-EndDate
                                                 v3       = ls_travel_result-TravelID
                                                 severity = if_abap_behv_message=>severity-error )
                         %element-BeginDate = if_abap_behv=>mk-on
                         %element-EndDate   = if_abap_behv=>mk-on ) TO reported-travel.

       ELSEIF ls_travel_result-BeginDate < cl_abap_context_info=>get_system_date( ).  "begin_date must be in the future

         APPEND VALUE #( %key       = ls_travel_result-%key
                         travelID   = ls_travel_result-TravelID ) TO failed-travel.

         APPEND VALUE #( %key = ls_travel_result-%key
                         %msg = new_message( id       = /dmo/cx_flight_legacy=>begin_date_before_system_date-msgid
                                             number   = /dmo/cx_flight_legacy=>begin_date_before_system_date-msgno
                                             severity = if_abap_behv_message=>severity-error )
                         %element-BeginDate = if_abap_behv=>mk-on
                         %element-EndDate   = if_abap_behv=>mk-on ) TO reported-travel.
       ENDIF.
     ENDLOOP.
   ENDMETHOD.
 ```>
 
2. Save ![save icon](images/adt_save.png) and activate ![activate icon](images/adt_activate.png) the changes.

</details>

## Exercise 5.4: Preview and Test the enhanced Travel App
[^Top of page](#)

Now the SAP Fiori elements app can be tested. 

 <details>
  <summary>Click to expand!</summary>

You can either refresh your application in the browser using **F5** if the browser is still open - or go to your service binding **`ZRAP100_UI_TRAVEL_O4_###`** and start the Fiori elements App preview for the **`Travel`** entity set.

1. Click **Create** to create a new entry.

2. Select an `Sunshine Travel (70001)` as Agency ID, select a customer by starting to add a name `Theresia`, Nov 20, 2022 as starting date and Nov 15, 2022 as end date. The draft will be updated.

    <!-- ![Preview](images/preview3.png) --Y
    <img src="images/preview3.png" alt="Preview" width="90%">        
     
3. Now click **Create**. You should get following error messages displayed:  
   *Begin Date 11/20/2022 must not be after End Date 11/16/2022* .

    <!-- ![Preview](images/preview4.png)  -->
    <img src="images/preview3.png" alt="Preview" width="90%">     

    ![Preview](images/preview5.png)
       
</details>

## Summary 
[^Top of page](#)

Now that you've... 
- defined two validations in the behavior definition, 
- implemented them in the behavior pool, and
- preview and test the enhanced Fiori elements app,

you can continue with the next exercise – **[Exercise 6: Enhance the BO Behavior – Actions](../ex6/readme.md)**

---

## Appendix
[^Top of page](#)

Find the source code for the behavior definition and behavior implementation class (aka behavior pool) in the [sources](sources) folder. Don't forget to replace all occurences of the placeholder `###` with your group ID.

- ![document](images/doc.png) [CDS BDEF ZRAP100_R_TRAVELTP_###](sources/EX5_BDEF_ZRAP100_R_TRAVELTP.txt)
- ![document](images/doc.png) [Class ZRAP100_BP_TRAVELTP_###](sources/EX5_CLASS_ZRAP100_BP_TRAVELTP.txt)

