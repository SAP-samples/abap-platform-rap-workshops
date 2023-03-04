@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED test feature control'
define root view entity ZR_ONLINESHOP_MS1
  as select from zaonlineshop_ms1 as zaonlineshop_ms1
{
  key orderuuid as OrderUUID,
  orderid as OrderID,
  ordereditem as Ordereditem,
  purchasereqn as Purchasereqn,
  prstatus as Prstatus,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  delivery_date as DeliveryDate,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  quantity as quantity,
  descriptiontext as DescriptionText
  ,
  url as URL
  
}
 