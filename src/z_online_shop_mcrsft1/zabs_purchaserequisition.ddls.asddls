@EndUserText.label: 'Event Structure'


define abstract entity ZABS_purchaserequisition
{
  
  email      : abap.char(10);
  created_by : abp_creation_user;
  created_at : abp_creation_tstmpl;
  purchase_requisition : abap.char(10);
  }
