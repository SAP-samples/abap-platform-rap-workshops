@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'items valuehelp'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_items as select from zitems {
@UI.lineItem: [{ position: 10, importance: #HIGH }]
    key item as Item
    ,
    @UI.lineItem: [{ position: 20, importance: #HIGH }]
        product as Product,
        @UI.lineItem: [{ position: 30, importance: #HIGH }]
    productgroup as Productgroup,
    @UI.lineItem: [{ position: 40, importance: #HIGH }]
@Semantics.amount.currencyCode: 'Currency'
    price as Price,
    @UI.lineItem: [{ position: 50, importance: #HIGH }]
    curreny as Currency
 

    
}
