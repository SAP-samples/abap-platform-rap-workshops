@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_ONLINESHOP_000'
define root view entity ZC_ONLINESHOP_000
  provider contract transactional_query
  as projection on ZR_ONLINESHOP_000
{
  key OrderUUID,
      OrderID,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_PRODUCT_VH_REUSE', element: 'Product' },
                                     useForValidation: true }  ]
      OrderItemID,
      OrderItemPrice,
      OrderItemQuantity,
      TotalPrice,
      Currency,
      OverallStatus,
      OverallStatusIndicator,
      DeliveryDate,
      Notes,
      PurchaseRequisition,
      PurchRqnCreationDate,
      LocalLastChangedAt,
      CreatedAt,
      ProductGroup,
      ProductText,
      BaseUnit,
      _Product

}
