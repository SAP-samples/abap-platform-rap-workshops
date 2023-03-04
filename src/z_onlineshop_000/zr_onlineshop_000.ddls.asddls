@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Onlineshop App 000'
define root view entity ZR_ONLINESHOP_000
  as select from zaonlineshop_000 as OnlineShop
  association [1..1] to ZI_PRODUCT_VH_REUSE as _Product on $projection.OrderItemID = _Product.Product
{
  key order_uuid               as OrderUUID,
      order_id                 as OrderID,
      order_item_id            as OrderItemID,
      @Semantics.amount.currencyCode: 'Currency'
      order_item_price         as OrderItemPrice,
      order_item_quantity      as OrderItemQuantity,
      @Semantics.amount.currencyCode: 'Currency'
      total_price              as TotalPrice,
      currency                 as Currency,
      overall_status           as OverallStatus,
      overall_status_indicator as OverallStatusIndicator,
      delivery_date            as DeliveryDate,
      notes                    as Notes,
      purchase_requisition     as PurchaseRequisition,
      purch_rqn_creation_date  as PurchRqnCreationDate,
      @Semantics.user.createdBy: true
      created_by               as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at               as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by          as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at          as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at    as LocalLastChangedAt,
      _Product.ProductGroup,
      _Product.ProductText,
      _Product.BaseUnit,
      _Product

}
