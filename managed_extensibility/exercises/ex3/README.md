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

Name: ZSC_RAP_GETPRICE_#### 
Description: **`Product price from ES5`**
Remote Consumption Model: Web Service (to be selected from the drop down box)

  ![Service Consumption Model](images/2020.png)

4. The WSDL file of the SOAP web service that you want to consume must be uploaded in file format. If you have not yet downloaded the WSDL file you have to do this now.

   - Click Browse to select the WSDL file that you have downloaded earlier in this exercise
   - Prefix: ZRAP_#### _

  ![Web Service Consumption Proxy](images/2030.png)

> ** Caution **

> Opposed to the prefix that we have chosen for **OData Service Consumption Proxy** we have to choose a leading *Z*. If not we get an error message that states: 
   *Package ZRAP_INVENTORY_1234 is a customer package, object RAP_1234_ is in SAP namespace.  Use a valid combination of object name*
>   ![Web Service Consumption Proxy](images/2025.png)
   



5. Selection of transport request

  ![Selection of transport request](images/2040.png)





