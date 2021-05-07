
[Home - RAP500](../../README.md#exercises)
  
# Exercises 1 - Create Analytical Data Model

## Introduction

In this exercise we will create a complete Analytical Data Model for Booking data. This consists out of dimension views for Carrier, Customer, Connection and Agency data, as well as an interface CDS view for Booking data which acts as a data source for the cube and the query.
Since the analytical views must contain certain analytical annotations we have created appropriate templates that you have imported in the previous exercise.

- [1.1 - Create a package](README.md#exercises-11---create-a-package)
- [1.2 - Dimensions](README.md#exercises-12---create-dimension-views)  
   - [1.2.1 - Create the first dimension for Carrier](README.md#exercises-121---create-the-first-dimension-for-carrier)    
   - [1.2.2 - Add a dimension for Customer](README.md#exercises-122---add-a-dimension-for-customer)  
   - [1.2.3 - Add a dimenstion for Connections (Flights)](README.md#exercises-123---add-a-dimenstion-for-connections-flights)  
   - [1.2.4 - Add a dimension for Agencies](README.md#exercises-124---add-a-dimension-for-agencies)  
 - [1.3 - Booking interface view](README.md#exercises-13---booking-interface-view)  
 - [1.4 - Cube](README.md#exercises-14---cube)  
 - [1.5 - Query](README.md#exercises-15---query)  
 - [1.6 - Data Preview](README.md#exercises-16---data-preview)
 - [Summary](README.md#exercises/ex1#summary)   

## Exercises 1.1 - Create a package  

> We start by creating a package to store all artefacts created in the SAP BTP ABAP environment.

<details>
  <summary>Click to expand!</summary>
  
1. Right click on your project and select **New** **ABAP Package**

    ![RightClick](images/1000.png)
  

2. In the **New --> ABAP Package** dialogue enter the following values and then press **Next**. 

   - Name: **ZRAP500_####**
   - Description: **Analytics workshop**  
   - Add to favorites packages: **X**  
   - Superpackage: **ZLOCAL**  
  
    ![Create package](images/1010.png)

   Please note:  
   There is a new check box *Add to favorites packages* available that let you add the newly created package to your favorite packages.  

3. Create a new transport request and press **Finish**.  
  
    ![Create transport request](images/1005.png)
   
  
</details>


## Exercises 1.2 - Create Dimension views 

> Dimensions views are links to various master data, which are later used in reporting as further attributes (according to which different aggregations can be made) and thus make up the versatility of our Analytical Model.  
> In the following we will create four dimension views for *Carrier*, *Customers*, *Connections* and *Travel Agencies* so that we can visualize our  
> measures *Number of bookings*  and *Flight price* in relation to these dimensions.  
> That means we will be able to create different charts that show how much money was spend for bookings for the connection  
> **Frankfurt-->New York** compared to the connection **Frankfurt-->Sydney** or that show how much money was spend for flights with a certain airline.  



### Exercises 1.2.1 - Create the first dimension for Carrier

<details>
<summary>Click to expand!</summary>
  
We will start to create a dimension view that contains the different Airlines / Carriers. Since our model will contain two measures, namly *Number of bookings* and *Flight Price* we will be able to answer questions such as 
- How much bookings are there per Carrier ? or 
- How much money was spend for bookings for a certain Airline?  

1. Right-click your package and choose **New --> Other ABAP Repository Object**.

    ![RightClick](images/1020.png)
    
2. Choose **Core Data Services --> Data Definition** and click **Next**.

    ![new data definition](images/1030.png)

3. Enter the following values  

   - *Name*: **ZRAP500_I_Carrier_####**  
   - *Description*:  **Dimension for Carrier**  
   - *Referenced Object*: **/dmo/carrier**  
   
   and click **Next**.

   Please note:  
   By selecting a table or another CDS view as *Referenced object* the wizard will use this object as a data source for the new CDS view and it will automatically add all fields into the DDL source code and it will also create camelCase aliases if needed.

     ![new dimension](images/1040.png)
     
4. Choose a transport request and press **Next**.   

   Do **NOT** press Finish, because otherwise the wizard will not provide us the option to choose a specific template but would choose the template that you have used the last time.

    ![select transport](images/1050.png)

5. In the *Define New Entity Definition* dialogue choose the template **Define a View Entity for a Dimension** and press **Finish**.  

   Please note:  
   The *Define a View Entity for a Dimension* template is one of the new Data Defintion templates that you have imported in the first part of this exercise. This template contains certain annotations which will be explained below that are mandatory for dimension views. 

    ![view for dimension](images/1060.png)
    
6. You now have to edit the dimension view.  
Here you can use code completion to add the values for the annotations <pre>@ObjectModel.representativeKey</pre> and <pre>@ObjectModel.text.element</pre> that are needed for our dimension view. 

   ![edit in ADT](images/1070.png) 

7. Click on **'representativeKey'**, delete the placeholder **representativKey** so that you get an empty string **''** , press *CTRL+Space* and choose **CarrierId** 
   
   ![edit in ADT](images/1080.png) 
   
8. Click on **textElement**, delete the placeholder string **textElement**, ** press *CTRL+Space* and choose **Name**.
    
   ![edit in ADT](images/1090.png)  
       
9. Save and activate the dimension.
   
   ![edit in ADT](images/1100.png)  

> **Coding explained**  
> | Code | Explanation |
> | ------------- | ---------- |
> | @Metadata.ignorePropagatedAnnotations: true | We ignore annotations from tables and base views, because we want to completely control/override the annotations here. |
> | @Analytics.dataCategory | We define this CDS view as a dimension. |
> | @Analytics.internalName: #LOCAL | Create UUIDs. |
>| @ObjectModel.representativeKey: 'CarrierId' | We define **CarrierID** as the representative key to be able to refer to it using @ObjectModel.foreignKey.association in the Cube that we will create later |
> |  @ObjectModel.text.element: ['Name'] | Using this annotation we define that the attribute **Name**, contains the text element for a given CarrierId. |  


Your final code should look like following:
#### ZRAP500_I_Carrier_####
   
   <details open><summary>Source code ZRAP500_I_Carrier_####</summary>
     
   <p>
   <pre>

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Dimension for Carrier'
@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.representativeKey: 'CarrierId'

define view entity ZRAP500_I_Carrier_####
  as select from /dmo/carrier
{
      @ObjectModel.text.element: ['Name']
  key carrier_id    as CarrierId,
      name          as Name,
      currency_code as CurrencyCode
}

   </pre>

   </p>
   </details>


[^Top of page](README.md)  

</details>

### Exercises 1.2.2 - Add a dimension for Customer

<details>
  <summary>Click to expand!</summary>
  
The data for customers is contained in the table **/dmo/customer**. So you have to follow all steps above and create a dimension **ZRAP500_I_Customer_####** and use the table **/DMO/customer** as a data source / reference object.  
The table /dmo/customer contains the columns first_name and last_name, but not the full name of the customer. We will hence add a new field to our CDS view where we calculate the full name so that we can use it as the text element for the key field CustomerId.  
The table /dmo/customer also contains fields that are too long to be used in analytics scenarios and it contains administrative fields that we do not want to show. We will hence delete these fields from the field list after having used the  **Define a View Entity for a Dimension** template.

1. Right click on the folder **Data Defintions --> New --> Data Definition**. 
 
    ![New Data Definition](images/1200.png)    
   
2. Enter the following values and press **Next**

   - *Name*: **ZRAP500_I_Customer_####**
   - *Description*: **Dimension for Customer**
   - *Referenced Object*: **/dmo/customer**

    ![Define customer dimenstion](images/1211.png)

3. Select a transport request and press **Next**
4. Select again the template **Define a View Entity for Dimension** and press **Finish**
5. Add a new field **CustomerName** which will later be specified as the text element for the key field.
    
<pre> concat_with_space(first_name, last_name, 1) as CustomerName, </pre>
    
6. Remove or comment out these fields because they are too long for our analytics scenarios and we do not need any administration fields.

<pre>
//    email_address as EmailAddress,
    
//    createdby as Createdby,
    
//    createdat as Createdat,
    
//    lastchangedby as Lastchangedby,
    
//    lastchangedat as Lastchangedat
</pre>
  
7. Add the association **_Country** 
 
   <pre>association [1] to I_Country as _Country on $projection.CountryCode = _Country.Country</pre>
       
   and add
 
   <pre>_Country</pre> to the field list so that it is exposed.       
   
   ![Add new fields and an asspciation](images/1220.png)     

8. Choose the property **CustomerId** for the annotation **@ObjectModel.representativeKey**

    ![Add representativeKey](images/1230.png) 

9. Choose the newly created property **CustomerName** for the annotation **@ObjectModel.text.element**

    ![Add textElement](images/1240.png) 

10. Save and activate the dimension.
        
> **Please note:**         
> We expose the association **_Country** to be able to access country information in the cube and query.   

Your final code should look like the following:
#### ZRAP500_I_Customer_####
   <details open><summary>Source code ZRAP500_I_Customer_####</summary>
   <p>
   <pre>
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Dimension for Customer'
@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.representativeKey: 'CustomerId'

define view entity ZRAP500_I_Customer_####
  as select from /dmo/customer
  association [1] to I_Country as _Country on $projection.CountryCode = _Country.Country
{
      @ObjectModel.text.element: ['CustomerName']
  key customer_id                                 as CustomerId,
      first_name                                  as FirstName,
      last_name                                   as LastName,
      concat_with_space(first_name, last_name, 1) as CustomerName,
      title                                       as Title,
      street                                      as Street,
      postal_code                                 as PostalCode,
      city                                        as City,
      country_code                                as CountryCode,
      phone_number                                as PhoneNumber,
      //    email_address as EmailAddress,
      //    createdby as Createdby,
      //    createdat as Createdat,
      //    lastchangedby as Lastchangedby,
      //    lastchangedat as Lastchangedat
      _Country
}
   </pre>

   </p>
   </details>

[^Top of page](README.md)  

</details>

### Exercises 1.2.3 - Add a dimenstion for Connections (Flights)

<details>
  <summary>Click to expand!</summary>  
  
The information about the connections (flights) is stored in the table **/dmo/connection**. In this dimension view we again add a new field. The newly created field **Trip** will show the departure airport and the destination airport in one string. 
For tables such as /dmo/connection that contain more than one key field, the key fields that are not annoted as the representative key field have to be annotated with a foreign key relationship.
Since the key field **ConnectionId** will be annotated as the representativeKey we have to add an assocation that points to the Carrier dimension view which will be added as a foreign key relationship to the key field **CarrierId**.

1. Right click on the folder **Data Defintions --> New --> Data Definition**.    
2. Enter the following values and press **Next**

   - *Name*: **ZRAP500_I_Connection_####**
   - *Description*: **Dimension for Connections**
   - *Referenced Object*: **/dmo/connection**

3. Select a transport request and press **Next**
4. Select again the template **Define a View Entity for Dimension** and press **Finish**
5. Add a new field **Trip** which will later be specified as the text element for the key field **ConnectionId**.
    
    `concat(airport_from_id, concat(' -> ', airport_to_id)) as Trip, `

6. Add an assosiation **_Carrier**

   <pre> 
   association [1] to ZRAP500_I_Carrier_#### as _Carrier on $projection.CarrierId = _Carrier.CarrierId
   </pre>  
   
   and expose it in the field list by adding
   
   <pre> _Carrier </pre>.
   
 7. Add the following annotation to the key field **CarrierId** 
   
    <pre> @ObjectModel.foreignKey.association: '_Carrier' </pre>
    
 8. Select the field  `ConnectionId` for the annotation `@ObjectModel.representativeKey`
 
 9. Select the field `Trip` for the annotation `@ObjectModel.text.element`
   
 10. Save and activate the dimension view.
    
Your final code should look like the following:
#### ZRAP500_I_Connection_####

   <details open><summary>Source code ZRAP500_I_Connection_####</summary>
   <p>
   <pre>

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Dimension for Connections'
@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.representativeKey: 'ConnectionId'

define view entity ZRAP500_I_CONNECTION_#### as select from /dmo/connection 
association [1] to ZRAP500_I_Carrier_#### as _Carrier on $projection.CarrierId = _Carrier.CarrierId{
    @ObjectModel.text.element: ['Trip']
    @ObjectModel.foreignKey.association: '_Carrier'
    key carrier_id as CarrierId,
    key connection_id as ConnectionId,
    airport_from_id as AirportFromId,
    airport_to_id as AirportToId,
    concat(airport_from_id, concat('->', airport_to_id)) as Trip,
    departure_time as DepartureTime,
    arrival_time as ArrivalTime,
    distance as Distance,
    distance_unit as DistanceUnit,
    _Carrier
}
   </pre>

   </p>
   </details>

[^Top of page](README.md)  

</details>

### Exercises 1.2.4 - Add a dimension for Agencies

<details>
  <summary>Click to expand!</summary>

The information about the Agencies that perform the bookings is stored in the table `/dmo/agencies`.

1. Right click on the folder **Data Defintions --> New --> Data Definition**.    
2. Enter the following values and press **Next**

   - *Name*: **ZRAP500_I_Agency_####**
   - *Description*: **Dimension for Agencies**
   - *Referenced Object*: **/dmo/agency**

3. Select a transport request and press **Next**  
4. Select again the template **Define a View Entity for Dimension** and press **Finish**  
5. Remove these fields because they are too long for our analytics scenarios

   <pre> 
        //    email_address as EmailAddress,
        //    web_address as WebAddress
   </pre> 
   
6. Choose the property **Name** for the annotation **@ObjectModel.text.element**.

   <pre>  @ObjectModel.text.element: ['Name'] </pre>
   
7. Choose the property **AgencyId** for the annotation **@ObjectModel.representativeKey**.

   <pre> @ObjectModel.representativeKey: 'AgencyId' </pre>
   
8. Save and activate the dimension view.

Your final code should look like the following:
#### ZRAP500_I_Agency_####

   <details open><summary>Source code ZRAP500_I_Agency_####</summary>
   <p>
   <pre>


@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Dimension for Agency'
@Metadata.ignorePropagatedAnnotations: true

@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@ObjectModel.representativeKey: 'AgencyId'

define view entity ZRAP500_I_Agency_#### as select from /dmo/agency {
    @ObjectModel.text.element: ['Name']
    key agency_id as AgencyId,
    name as Name,
    street as Street,
    postal_code as PostalCode,
    city as City,
    country_code as CountryCode,
    phone_number as PhoneNumber
//    ,
//    email_address as EmailAddress,
//    web_address as WebAddress
}
   </pre>

   </p>
   </details>

[^Top of page](README.md)  

</details>

## Exercises 1.3 - Booking interface view

> We will create a CDS interface view as an additional layer which is later used as the data source of our cube. This view adds the field AgencyId so that this can be used as a dimension field in our cube.

<details>
  <summary>Click to expand!</summary>

1. Right click on the folder **Data Definitions** and choose **New --> New Data Definition** from the context menu.  

2. Enter the following values and press **Next**

   - *Name*: **ZRAP500_I_Booking_####**
   - *Description*: **Interface View for Booking**
   - *Referenced Object*: **/DMO/I_Booking_U**   
   
    ![new interface](images/1300.png)  
   
3. Select a transport request and press **Next**.  
   Do **NOT** press finish at this point because we want to select a different template in the next step.  
4. This time select the template **Define a View Entity** and then press **Finish**

    ![new interface](images/1310.png)

5. Add an annotation `@Semantics.amount.currencyCode` to the property **Flight Price** that points to the property `CurrencyCode`.

   <pre> @Semantics.amount.currencyCode: 'CurrencyCode'</pre>

6. Add a new field **AgencyId**. The value for this field will be retrieved using the association **_Travel**.
   That points to the parent entity. This way the field AgencyId can be used as a dimension field. 
   
   <pre> _Travel.AgencyID as AgencyID, </pre>

   ![new field](images/1320.png)

7. Save and activate the interface view.

Your final code should look like the following:
#### ZRAP500_I_Booking_####
   <details open><summary>Source code ZRAP500_I_Booking_####</summary>
   <p>
   <pre>
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRAP500_I_Booking_#### as select from /DMO/I_Booking_U {
    key TravelID,
    key BookingID,
    BookingDate,
    CustomerID,
    AirlineID,
    ConnectionID,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    _Travel.AgencyID as AgencyID,
   
    /* Associations */
    _BookSupplement,
    _Carrier,
    _Connection,
    _Customer,
    _Travel
}

   </pre>

   </p>
   </details>  
   
[^Top of page](README.md)  

</details>

## Exercises 1.4 - Cube

> The Cube is the analytical interface view that is ultimately used in the query and "holds together" the model. In addition to the facts and the measurable key figures (if necessary also calculations), it contains references to the dimensions.

<details>
  <summary>Click to expand!</summary>

We will now use the Booking interface view as a data source to create a cube. All cubes must have at least one measure. The measurable data are the quantifiable fields that can be calculated, such as number of flight bookings and price of a flight. Using a query, you can SUM these fields. To create a cube, there is a mandatory header annotation:

 <pre>@Analytics.dataCategory: #CUBE </pre>

This annotation is part of the template **Define a View Entity for a Cube** that you have imported in your ADT installation at the beginning of this workshop.  

1. Right click **Data Definition** and choose **New --> New Data Definition**.

2. Enter the following values and press **Next**

   - *Name*: **ZRAP500_I_BookingCube_####**
   - *Description*: **Booking Cube**
   - *Referenced Object*: **ZRAP500_I_Booking_####** (The booking interface view)

    ![new cube](images/1270.png)

3. Choose a transport request and then choose **Define a View Entity for a Cube** and click **Finish**.

    ![template cube](images/1101.png)

4. Add the following associations
    <pre>
    association [0..1] to ZRAP500_I_Customer_####   as _Customer   on  $projection.CustomerID = _Customer.CustomerId  
    association [0..1] to ZRAP500_I_Carrier_####    as _Carrier    on  $projection.AirlineID = _Carrier.CarrierId  
    association [0..1] to ZRAP500_I_Connection_#### as _Connection on  $projection.AirlineID    = _Connection.CarrierId  
                                                                  and $projection.ConnectionId = _Connection.ConnectionId  
    association [0..1] to ZRAP500_I_AGENCY_####    as _Agency     on  $projection.AgencyID = _Agency.AgencyId  
    </pre>

    we also have to add the following to entries to the field list
  
    <pre>
      _Agency,
      _Customer._Country    as _CustomerCountry
    </pre>    

5. In the created cub we define foreignKey associatons via **_Customer**, **_Carrier**, **_Connection**, and **_Agency** to be able to fetch and expose informations in the cube and in the query.

     - Add the annotation **@ObjectModel.foreignKey.association: '_Customer'** to the field **CustomerId**  
     - Add the annotation **@ObjectModel.foreignKey.association: '_Carrier'** to the field **CarrierId**  
     - Add the annotation **@ObjectModel.foreignKey.association: '_Connection'** to the field **ConnectionId** 

6. Add an annotation `@Semantics.amount.currencyCode` to the property **Flight Price** that points to the property `CurrencyCode`.

7. Add the following two fields alongside with a foreign key association
    
     <pre>
      @ObjectModel.foreignKey.association: '_CustomerCountry'
      _Customer.CountryCode as CustomerCountry,
      _Customer.City        as CustomerCity,
    </pre>

8. We add fields that contain information about the customers

   <pre>
      @ObjectModel.foreignKey.association: '_CustomerCountry'
      _Customer.CountryCode as CustomerCountry,
      _Customer.City        as CustomerCity,
      _Connection.Trip      as Trip,
   </pre>

9. We now add Measures to our cube. 

   We add a field **TotalOfBookings**

   <pre>
      @EndUserText.label: 'Total of Bookings'
      @Aggregation.default: #SUM
      1                     as TotalOfBookings,
   </pre>
   
   and the field **Flight Price** which is annotated as follows
   
   <pre>
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Aggregation.default: #SUM
      FlightPrice,
   </pre>
   
10. Save and activate the cube.

11. Your final code should be look like follows:

    ![cube ADT](images/1110.png)
    



#### ZRAP500_I_BookingCube_#### 


<details open><summary>Source code ZRAP500_I_BookingCube_####</summary> 
   <p>
   <pre>

    @AccessControl.authorizationCheck: #CHECK
    @EndUserText.label: 'Booking Cube'
    @Metadata.ignorePropagatedAnnotations: true

    @Analytics.dataCategory: #CUBE
    @Analytics.internalName: #LOCAL


    define view entity ZRAP500_I_BookingCube_####
      as select from ZRAP500_I_Booking_####

      association [0..1] to ZRAP500_I_Customer_####   as _Customer   on  $projection.CustomerID = _Customer.CustomerId  
      association [0..1] to ZRAP500_I_Carrier_####    as _Carrier    on  $projection.AirlineID = _Carrier.CarrierId

      association [0..1] to ZRAP500_I_Connection_#### as _Connection on  $projection.AirlineID    = _Connection.CarrierId
                                                                     and $projection.ConnectionId = _Connection.ConnectionId

      association [0..1] to ZRAP500_I_Agency_####     as _Agency     on  $projection.AgencyID = _Agency.AgencyId

    {
      key TravelID,
      key BookingID,
          BookingDate,
          @ObjectModel.foreignKey.association: '_Customer'
          CustomerID,
          @ObjectModel.foreignKey.association: '_Carrier'
          AirlineID,
          @ObjectModel.foreignKey.association: '_Connection'
          ConnectionID          as ConnectionId,
          FlightDate,
          //      @Semantics.amount.currencyCode: 'CurrencyCode'
          //      FlightPrice,
          CurrencyCode,
          @ObjectModel.foreignKey.association: '_Agency'
          AgencyID,

          @ObjectModel.foreignKey.association: '_CustomerCountry'
          _Customer.CountryCode as CustomerCountry,
          _Customer.City        as CustomerCity,
          _Connection.Trip      as Trip,

          /* Measures */

          @EndUserText.label: 'Total of Bookings'
          @Aggregation.default: #SUM
          1                     as TotalOfBookings,

          @Semantics.amount.currencyCode: 'CurrencyCode'
          @Aggregation.default: #SUM
          FlightPrice,


          /* Associations */
          _BookSupplement,
          _Carrier,
          _Connection,
          _Customer,
          _Travel,
          _Agency,
          _Customer._Country    as _CustomerCountry
    }


   </pre>

   </p>
   </details>
   
[^Top of page](README.md)  

</details>

## Exercises 1.5 - Query

> The *query* is the "purpose-bound", specific version of the *cube*, i.e. the projection view. In particular, the query determines the display such as the assignment of fields to axes and further calculations.  
> 
> Since a query belongs to the projection layer (formerly known as consumption layer) it must have a **C** in its name according to the naming convention used in the *Virtual Data Model (VDM)* used in SAP S/4HANA. To create a query, there is a mandatory header annotation: **@Analytics.query: true** 

<details>
  <summary>Click to expand!</summary>

Again you can use a template that you have imported at the beginning of this workshop.

1. Right click **Data Definition** and choose **New Data Definition**.

2. Enter the following values and press **Next**

   - *Name*: **ZRAP500_C_BookingQuery_####**
   - *Description*: **Query for Booking**
   - *Referenced Object*: **ZRAP500_I_BookingCube_####**

    ![new query](images/1120.png)

3. Choose a transport request and then press **Next**

4. In the following dialogue choose **Define a View Entity for Query** and click **Finish**.

    ![template query](images/1130.png)

5. Edit the code of your query and add the annotation **@AnalyticsDetails.query.axis** to all properties except the two measures FlightPrice and TotalOfBookings. All fields beside the field **CustomerCountry** get the annotation **@AnalyticsDetails.query.axis: #ROWS**, whereas the field **CustomerCountry** gets the annotation **@AnalyticsDetails.query.axis: #COLUMN**.

6. We add a currency conversion to the field FlightPrice to be able to comparison all flight prices in a single currency.    

   <pre>
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion (
      amount => FlightPrice,
      source_currency => CurrencyCode,
      target_currency => cast( 'EUR' as abap.cuky( 5 ) ) ,
      exchange_rate_date => cast ('20200101' as abap.dats),
      exchange_rate_type => 'M'
      ) as FlightPrice 
   </pre>

7. Save and activate the query.

    ![ADTquery](images/1131.png)


> Please note:  
> Using the template the mandatory annotations for query is set automatically.
> **@Analytics.query: true**
> With the annotation **@AnalyticsDetails.query.axis:<VALUE>**, the elements of the view can be positioned on multiple axes: Rows, Columns and Free. The elements can be directly annotated with their axis. All measures (elements which can be aggregated) need to be on the same axis. The annotation of the first measure will therefore be used for all measures of the query. If **@AnalyticsDetails.query.axis:<VALUE>** is not found, the system positions the measures on the columns.
        
Your final code should look like the following:
#### ZRAP500_C_BOOKINGQUERY_####
   <details open><summary>Source code ZRAP500_C_BOOKINGQUERY_####</summary>
   <p>
   <pre>
   
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Query for Booking'


@Analytics.query: true

define view entity ZRAP500_C_BOOKINGQUERY_#### as select from ZRAP500_I_BookingCube_#### {
      @AnalyticsDetails.query.axis: #ROWS
  key TravelID,
      @AnalyticsDetails.query.axis: #ROWS
  key BookingID,
      @AnalyticsDetails.query.axis: #ROWS
      BookingDate,
      @AnalyticsDetails.query.axis: #ROWS
      CustomerID,
      @AnalyticsDetails.query.axis: #ROWS
      AirlineID,
      @AnalyticsDetails.query.axis: #ROWS
      ConnectionId,
      @AnalyticsDetails.query.axis: #ROWS
      FlightDate,
      @AnalyticsDetails.query.axis: #ROWS
      CurrencyCode,
      @AnalyticsDetails.query.axis: #ROWS
      AgencyID,
      @AnalyticsDetails.query.axis: #COLUMNS
      CustomerCountry,
      @AnalyticsDetails.query.axis: #ROWS
      CustomerCity,
      @AnalyticsDetails.query.axis: #ROWS
      Trip,

      TotalOfBookings,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion (
      amount => FlightPrice,
      source_currency => CurrencyCode,
      target_currency => cast( 'EUR' as abap.cuky( 5 ) ) ,
      exchange_rate_date => cast ('20200101' as abap.dats),
      exchange_rate_type => 'M'
      ) as FlightPrice    
}
   </pre>

   </p>
   </details>

[^Top of page](README.md)  

</details>

## Exercises 1.6 - Data preview

> Similar to the SAP Fiori Elements preview which is offered for OData V2 UI and OData V4 UI service bindings there is now an Analytical Data Preview available. This can be used by the ABAP developer to test the implementation of an Analytical Query since the preview uses the InA protocol.

<details>
  <summary>Click to expand!</summary>
  
Now that we have created the query it is possible to use a data preview to test our implementation.

1. Navigate to the folder **Data Definition** 
2. Right click on the query **ZRAP500_C_BOOKINGQUERY_####** and select **Open with --> Data Preview**

   ![RightClick](images/1155.png)

3. A new browser tab will open and you might have to authenticate using the credentials of your SAP BTP ABAP environment system (here D20).

   ![Authenticate](images/1157.png)

4. You can see the data that has been retrieved using the InA-Protocol. Please note that the measures are grouped by the **Country/Region Key**. 


   ![Data Preview](images/1159.png)

[^Top of page](README.md)  

</details>


## Summary  

Now you are ready to start with the second exercise where you will publish your analytical service so that it can be consumed **SAP Anayltics Cloud**.

Continue to next execise - [Exercise 2](../ex2/README.md)
