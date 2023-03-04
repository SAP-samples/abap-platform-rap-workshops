@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_ONLINESHOP_MS1'
define root view entity ZC_ONLINESHOP_MS1
  provider contract transactional_query
  as projection on ZR_ONLINESHOP_MS1
{
  key OrderUUID,
  OrderID,
  Ordereditem,
  Purchasereqn,
  Prstatus,
  DeliveryDate,
  LocalLastChangedAt,
  quantity,
  DescriptionText,
  URL,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy
  
  
}
