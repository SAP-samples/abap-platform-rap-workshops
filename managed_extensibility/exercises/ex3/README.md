# Exercise 3 - Consume a SOAP Web Service

In the following exercise you will learn how to call a SOAP web service and how to embed this into your inventory application by using it as part of a determination. The SOAP web service that we are going to use is a demo web service available on the SAP Gateway Demo system ES5.

## Download the WSDL

1. Create a text file with the extension .XML locally on your computer
2. Copy the content of the WSDL file into that file. The WSDL can be found here: [Link to WSDL](/exercises/ex3/sources/EPM_PRODUCT_SOAP.xml)

## Create the Service Consumption Model

In this step we will create a service consumption model based on the WSDL file that you have downloaded in the previous step.

1. Navigate to the folder **Business Services > Service Consumption Models** 

2. Right-click on the folder **Service Consumption Models**  and choose **New Service Consumption Model**

  ![New Service Consumption Model](images/2010.png)
  
3. The New Service Consumption Model dialogue opens. Here enter the following data:

Name: `ZSC_RAP_GETPRICE_####` <br/>
Description: `Product price from ES5` <br/>
Remote Consumption Model: `Web Service` (to be selected from the drop down box)

  ![Service Consumption Model](images/2020.png)

4. The WSDL file of the SOAP web service that you want to consume must be uploaded in file format. If you have not yet downloaded the WSDL file you have to do this now.

   - Click **Browse** to select the WSDL file that you have downloaded earlier in this exercise
   - Prefix: `ZRAP_####_`

  ![Web Service Consumption Proxy](images/2030.png)

> ** Caution **

> Opposed to the prefix that we have chosen for **OData Service Consumption Proxy** we have to choose a leading *Z*. If not we get an error message that states: 
   *Package ZRAP_INVENTORY_1234 is a customer package, object RAP_1234_ is in SAP namespace.  Use a valid combination of object name*
>   ![Web Service Consumption Proxy](images/2025.png)
   



5. Selection of transport request

   - Select a transport request
   - Press **Finish**

  ![Selection of transport request](images/2040.png)

6. Service Consumption Model

The Web Service does only have one service operation `get_price`. Use the **Copy to clipboard** button to copy the code sample for this service operation to the clipboard. We will use it in the following step.


![Web Service Consumption Proxy](images/2050.png)

7. Check generated objects

When checking the *Project Explorer* you will notice that several objects have been generated. For those that are used to the generation of SOAP Web Service proxies in on premise systems they will look familiar.

![Web Service Consumption Proxy](images/2060.png)

8. Add a determination in the BDEF

  - Open your behavior definition `ZI_RAP_INVENTORY_####`
  - Add the following code snippet to add a determination for the field `Price`
  
  <pre>
  determination GetPrice on modify { field ProductID; }
  </pre>

![Web Service Consumption Proxy](images/2065.png)

  - Select the determination name `GetPrice` and press **CTRL+1** for a quick fix
  - Double click on the quick fix **Add missing method for determination GetPrice in local handler class ...**

![Web Service Consumption Proxy](images/2070.png)

9. Add the following code in the implementation of the method GetPrice.

<pre>
  METHOD GetPrice.
    "Ensure idempotence
    READ ENTITIES OF zi_rap_inventory_#### IN LOCAL MODE
      ENTITY Inventory
        FIELDS ( Price ProductID )
        WITH CORRESPONDING #( keys )
      RESULT DATA(inventories).

    DELETE inventories WHERE Price IS NOT INITIAL.
    CHECK inventories IS NOT INITIAL.

    DELETE inventories WHERE ProductID =''.
    CHECK inventories IS NOT INITIAL.

    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_url( i_url = 'https://sapes5.sapdevcenter.com/sap/bc/srt/xip/sap/zepm_product_soap/002/epm_product_soap/epm_product_soap' ).

        DATA(proxy) = NEW zrap_####_co_epm_product_soap(
                        destination = destination
                      ).

      CATCH cx_soap_destination_error INTO DATA(soap_destination_error).
        "handle error
      CATCH cx_ai_system_fault INTO DATA(ai_system_fault).
        "handle error
      CATCH zrap_####_cx_fault_msg_type INTO DATA(zrap_####_cx_fault_msg_type).
        "handle error
    ENDTRY.

    LOOP AT inventories ASSIGNING FIELD-SYMBOL(<inventory>).
      TRY.

          DATA(request) = VALUE zrap_####_req_msg_type( req_msg_type-product = <inventory>-ProductID ).
          proxy->get_price(
            EXPORTING
              input = request
            IMPORTING
              output = DATA(response)
          ).

          <inventory>-Price = response-res_msg_type-price .
          <inventory>-CurrencyCode = response-res_msg_type-currency.
          "handle response
        CATCH cx_soap_destination_error INTO soap_destination_error.
          "handle error
        CATCH cx_ai_system_fault INTO ai_system_fault.
          "handle error
        CATCH zrap_1234_cx_fault_msg_type INTO zrap_####_cx_fault_msg_type.
          "handle error
      ENDTRY.

    ENDLOOP.



    "update involved instances
    MODIFY ENTITIES OF zi_rap_inventory_1234 IN LOCAL MODE
      ENTITY Inventory
        UPDATE FIELDS ( Price CurrencyCode )
        WITH VALUE #( FOR inventory IN inventories (
                           %tky      = inventory-%tky
                           Price  = inventory-Price
                           CurrencyCode  = inventory-CurrencyCode
                           ) )
    REPORTED DATA(reported_entities).

    "fill reported
    reported = CORRESPONDING #( DEEP reported_entities ).
    
  ENDMETHOD.

</pre>





