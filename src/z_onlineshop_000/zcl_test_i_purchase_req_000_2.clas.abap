CLASS zcl_test_i_purchase_req_000_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_i_purchase_req_000_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.




    DATA: purchase_requisitions      TYPE TABLE FOR CREATE I_PurchaserequisitionTP,
          purchase_requisition       TYPE STRUCTURE FOR CREATE I_PurchaserequisitionTP,
          purchase_requisition_items TYPE TABLE FOR CREATE i_purchaserequisitionTP\_PurchaseRequisitionItem,
          purchase_requisition_item  TYPE STRUCTURE FOR CREATE i_purchaserequisitiontp\\purchaserequisition\_purchaserequisitionitem,
          purchase_reqn_acct_assgmts TYPE TABLE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnAcctAssgmt,
          purchase_reqn_acct_assgmt  TYPE STRUCTURE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnAcctAssgmt,
          purchase_reqn_item_texts   TYPE TABLE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnItemText,
          purchase_reqn_item_text    TYPE STRUCTURE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnItemText,
          delivery_date              TYPE I_PurchaseReqnItemTP-DeliveryDate.

    delivery_date = cl_abap_context_info=>get_system_date(  ) + 14.

    DATA n TYPE i.

    n += 1.
*    "purchase requisition
*    purchase_requisition = VALUE #(  %cid                   = |My%CID_{ n }|
*                                      purchaserequisitiontype  = 'NB'
*                                      PurReqnDescription = 'Hugo' ) .
*    APPEND purchase_requisition TO purchase_requisitions.

    "purchase requisition item
    purchase_requisition_item = VALUE #(
*                                       %cid_ref = |My%CID_{ n }|
*                                        purchaserequisition = '10001458'
                                       purchaserequisition = '10001459'
                                       %target  = VALUE #(  (


**"Printer Professional
                                             %cid                            = 'My%ItemCID_1'
                                             plant                           = '1010'
*                                             purchaserequisitionitemtext     = 'Test Released APIs 2'
                                               accountassignmentcategory     = 'U'
                                             requestedquantity               =  n
*                                             baseunit                        = 'EA'
                                             purchaserequisitionprice        = '10.00'
                                             purreqnitemcurrency             = 'EUR'
                                             materialgroup                   = 'L001'
                                             purchasinggroup                 = '001'
                                             purchasingorganization          = '1010'
                                             DeliveryDate                    = Delivery_Date
                                             Material                        = 'ZPRINTER01'

**"Printer Platinum

*                                             %cid                            = 'My%ItemCID_1'
*                                             plant                           = '1010'
*                                             purchaserequisitionitemtext     = 'Test Released APIs'
*                                               accountassignmentcategory     = 'U'
*                                             requestedquantity               =  n
**                                             baseunit                        = 'EA'
*                                             purchaserequisitionprice        = '10.00'
*                                             purreqnitemcurrency             = 'EUR'
*                                             materialgroup                   = 'L001'
*                                             purchasinggroup                 = '001'
*                                             purchasingorganization          = '1010'
*                                             DeliveryDate                    = Delivery_Date
*                                             Material                        = 'ZPRINTER02'

                                                     ) ) ).
    APPEND purchase_requisition_item TO purchase_requisition_items.

    "purchase requisition account assignment
    purchase_reqn_acct_assgmt = VALUE #(
                                         %cid_ref = |My%ItemCID_{ n }|
                                         %target  = VALUE #( (
                                                      %cid       = |My%AccntCID_{ n }|
                                                      CostCenter = 'JMW-COST'
                                                      GLAccount  = '0000400000' ) ) ) .
    APPEND purchase_reqn_acct_assgmt TO purchase_reqn_acct_assgmts .

    "purchase requisition item text
    purchase_reqn_item_text    =  VALUE #(
                                         %cid_ref = |My%ItemCID_{ n }|
                                         %target  = VALUE #( (
                                                      %cid           = |My%TextCID_{ n }|
                                                      textobjecttype = 'B01'
                                                      language       = 'E'
                                                      plainlongtext  = 'Commandline test via F9'
                                                  )  )  ) .
    APPEND purchase_reqn_item_text TO purchase_reqn_item_texts.


    "EML deep create statement


    MODIFY ENTITIES OF i_purchaserequisitiontp

      "purchase reqn
       ENTITY purchaserequisition
*      CREATE FIELDS ( purchaserequisitiontype PurReqnDescription  )
*      WITH purchase_requisitions

      "purchase reqn item
      CREATE BY \_purchaserequisitionitem
      FIELDS ( plant

*                   purchaserequisitionitemtext  "product description of the selected material will be used
               accountassignmentcategory
               requestedquantity
               baseunit
               purchaserequisitionprice
               purreqnitemcurrency
               Material
               materialgroup
               purchasinggroup
               purchasingorganization
               DeliveryDate
              )
      WITH purchase_requisition_items
    "purchase reqn account assignment
    ENTITY purchaserequisitionitem

    CREATE BY \_purchasereqnacctassgmt
          FIELDS ( CostCenter
                   GLAccount
                   Quantity
*                   BaseUnit
                   )
          WITH purchase_reqn_acct_assgmts
      "purchase reqn item text
    CREATE BY \_purchasereqnitemtext
          FIELDS ( plainlongtext )
          WITH purchase_reqn_item_texts

    REPORTED DATA(pr_reported)
    MAPPED DATA(pr_mapped)
    FAILED DATA(pr_failed).

    out->write( 'mapped' ).
    LOOP AT pr_mapped-purchaserequisition INTO DATA(mapped_pr).
      out->write( |pid:{  mapped_pr-%pid }| ).
    ENDLOOP.
    out->write( 'failed' ).
    LOOP AT pr_failed-purchaserequisition INTO DATA(failed_pr).
      out->write( |pid:{  failed_pr-%pid }| ).
    ENDLOOP.
    out->write( 'reported' ).
    LOOP AT pr_reported-purchaserequisition INTO DATA(reported_pr).
      out->write( |pid:{  reported_pr-%pid }| ).
      out->write( |message:{  reported_pr-%msg->if_message~get_text(  )  }| ).
    ENDLOOP.

    COMMIT ENTITIES .

    out->write( |sy-subrc { sy-subrc }| ).



  ENDMETHOD.


ENDCLASS.
