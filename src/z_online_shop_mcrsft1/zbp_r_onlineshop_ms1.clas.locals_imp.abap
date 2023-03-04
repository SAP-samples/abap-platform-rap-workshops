CLASS lsc_zr_onlineshop_ms1 DEFINITION INHERITING FROM cl_abap_behavior_saver.



  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_onlineshop_ms1 IMPLEMENTATION.

  METHOD save_modified.
    DATA : lt_online_shop_as TYPE STANDARD TABLE OF zaonlineshop_ms1,
           ls_online_shop_as TYPE                   zaonlineshop_ms1.

    IF create-onlineshop IS NOT INITIAL.
      READ ENTITIES OF zr_onlineshop_ms1 IN LOCAL MODE
      ENTITY onlineshop
      FIELDS ( orderid createdby )
      WITH CORRESPONDING #( create-onlineshop )
      RESULT DATA(orders).
      LOOP AT orders INTO DATA(order) WHERE orderid IS NOT INITIAL.
        zcl_ms1=>abap_sdk_read( orderid = order-orderid
                                createdby = order-createdby ).
      ENDLOOP.
    ENDIF.

    IF zbp_r_onlineshop_ms1=>mapped_purchase_requisition IS NOT INITIAL.
      LOOP AT zbp_r_onlineshop_ms1=>mapped_purchase_requisition-purchaserequisition ASSIGNING FIELD-SYMBOL(<fs_pr_mapped>).
        CONVERT KEY OF i_purchaserequisitiontp FROM <fs_pr_mapped>-%pid TO DATA(ls_pr_key).
        <fs_pr_mapped>-purchaserequisition = ls_pr_key-purchaserequisition.
*        zbp_r_onlineshop_ms1=>cv_pr_pid = <fs_pr_mapped>-%pid.
      ENDLOOP.
    ENDIF.
    LOOP AT update-onlineshop INTO  DATA(ls_online_shop) WHERE %control-prstatus = if_abap_behv=>mk-on.
      " Creates internal table with instance data
      UPDATE zaonlineshop_ms1 SET purchasereqn = @ls_pr_key-purchaserequisition  WHERE orderuuid = @ls_online_shop-orderuuid.
    ENDLOOP.

*data : is_data type ZABS_purchaserequisition.
*raise entity event zr_onlineshop_ms1~sendPurchaseRequisitionDetails
*        from value #( ( %key    = CORRESPONDING #( is_data )
*                        %param  = CORRESPONDING #( is_data ) ) ).
*    endif.
*    ENDLOOP.
*

  ENDMETHOD.

ENDCLASS.

CLASS lcl_handler DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR onlineshop
        RESULT result,
      createpurchaserequisitionitem FOR MODIFY
        IMPORTING keys FOR ACTION onlineshop~createpurchaserequisitionitem RESULT result,
      get_instance_features FOR INSTANCE FEATURES
        IMPORTING keys REQUEST requested_features FOR onlineshop RESULT result,
      calculateorderid FOR DETERMINE ON MODIFY
        IMPORTING keys FOR onlineshop~calculateorderid,
      checkquantity FOR VALIDATE ON SAVE
        IMPORTING keys FOR onlineshop~checkquantity,
      checkdescription FOR VALIDATE ON SAVE
        IMPORTING keys FOR onlineshop~checkdescription.

ENDCLASS.

CLASS lcl_handler IMPLEMENTATION.
  METHOD get_instance_features.
    READ ENTITIES OF zr_onlineshop_ms1
      IN LOCAL MODE
      ENTITY onlineshop
      FIELDS ( prstatus ) WITH CORRESPONDING #( keys )
      RESULT DATA(purchaserequisitionitemsstatus)
      FAILED failed.
    result = VALUE #( FOR itemstatus IN purchaserequisitionitemsstatus
                      LET status = COND #( WHEN itemstatus-prstatus = 'In Process'
                                                 THEN if_abap_behv=>fc-o-disabled
                                                  ELSE if_abap_behv=>fc-o-enabled )
                                                  IN ( %tky = itemstatus-%tky
                                                       %action-createpurchaserequisitionitem = itemstatus-prstatus  )
                                                   ).
  ENDMETHOD.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD createpurchaserequisitionitem.
    DATA: purchase_requisition           TYPE TABLE FOR CREATE i_purchaserequisitiontp,
          purchase_requisition_item      TYPE TABLE FOR CREATE i_purchaserequisitiontp\_purchaserequisitionitem,
          purchase_requisition_acnt_asnt TYPE TABLE FOR CREATE i_purchasereqnitemtp\_purchasereqnacctassgmt,
          purchase_requisition_itm_txt   TYPE TABLE FOR CREATE i_purchasereqnitemtp\_purchasereqnitemtext,
          update                         TYPE TABLE FOR UPDATE zr_onlineshop_ms1\\onlineshop,
          update_line                    TYPE STRUCTURE FOR UPDATE zr_onlineshop_ms1\\onlineshop,
          delivery_date                  TYPE i_purchasereqnitemtp-deliverydate,
          requested_quantity             TYPE i_purchasereqnitemtp-requestedquantity,
          purchase_requisition_item_line TYPE STRUCTURE FOR CREATE i_purchaserequisitiontp\\purchaserequisition\_purchaserequisitionitem.

    delivery_date = cl_abap_context_info=>get_system_date(  ) + 14.
*        delivery_date = cl_abap_context_info=>get_system_date(  ) .


    READ ENTITIES OF zr_onlineshop_ms1 IN LOCAL MODE
          ENTITY onlineshop
            ALL FIELDS WITH
            CORRESPONDING #( keys )
          RESULT DATA(items).
loop at items into data(item).
    MODIFY ENTITIES OF i_purchaserequisitiontp
ENTITY purchaserequisition
CREATE FIELDS ( purchaserequisitiontype )
WITH VALUE #(  ( %cid                    = 'My%CID_1'
                purchaserequisitiontype = 'NB' ) )

CREATE BY \_purchaserequisitionitem
FIELDS (
*       Material
       plant
       purchaserequisitionitemtext
       accountassignmentcategory
       requestedquantity
       baseunit
       purchaserequisitionprice
       purreqnitemcurrency
       materialgroup
       purchasinggroup
       purchasingorganization
       deliverydate
*               MultipleAcctAssgmtDistribution
           )
WITH VALUE #(
            (    %cid_ref = 'My%CID_1'
                 %target = VALUE #(
                                  (  %cid                            = 'My%ItemCID_1'
                                     plant                           = '1010'
                                     purchaserequisitionitemtext     =  items[ 1 ]-descriptiontext
                                       accountassignmentcategory     = 'U'

                                     requestedquantity               = items[ 1 ]-quantity
                                     baseunit                        = 'EA'
                                     purchaserequisitionprice        = '80.00'
                                     purreqnitemcurrency             = 'EUR'
*                                     material                        = item-
                                     materialgroup                   =  'YBFA08' "'A001'
                                     purchasinggroup                 = '001'
                                     purchasingorganization          = '1010'
                                     deliverydate                    = delivery_date


                                     )
                                  )
             )
           )
ENTITY purchaserequisitionitem

CREATE BY \_purchasereqnacctassgmt
FIELDS ( costcenter
        glaccount
        quantity
        baseunit )
WITH VALUE #( (   %cid_ref = 'My%ItemCID_1'
                 %target  = VALUE #( ( %cid         = 'My%AccntCID_1'
                                       costcenter   = 'JMW-COST'
                                       glaccount    = '0000400000' ) ) ) )
CREATE BY \_purchasereqnitemtext
FIELDS ( plainlongtext )
WITH VALUE #(  (   %cid_ref = 'My%ItemCID_1'
                 %target  = VALUE #( ( %cid          = 'My%TextCID_1'
                                     textobjecttype = 'B01'
                                     language       = 'E'
                                     plainlongtext  = 'DKOM2021: item text created from PAAS API'
                                   ) ( %cid         = 'My%TextCID_2'
                                     textobjecttype = 'B02'
                                     language       = 'E'
                                     plainlongtext  = 'item2 text created from PAAS API'
                                   ) )
         )   )
     REPORTED DATA(ls_pr_reported)
     MAPPED DATA(ls_pr_mapped)
     FAILED DATA(ls_pr_failed).

    zbp_r_onlineshop_ms1=>mapped_purchase_requisition-purchaserequisition = ls_pr_mapped-purchaserequisition.
ENDLOOP.
    "set a flag to check in the save sequence that purchase requisition has been created
    "the correct value for PurchaseRequisition has to be calculated in the save sequence using convert key

    LOOP AT items INTO DATA(item_update).
      update_line-prstatus = 'In Process'.
      update_line-%tky      = item_update-%tky.
      APPEND update_line TO update.
    ENDLOOP.

    MODIFY ENTITIES OF zr_onlineshop_ms1
    IN LOCAL MODE
    ENTITY onlineshop
    UPDATE
    FIELDS ( prstatus )
    WITH update
*    MAPPED DATA(pr_mapped).


    REPORTED reported
    FAILED failed
    MAPPED mapped.

    DATA shopped_items TYPE TABLE FOR READ RESULT zr_onlineshop_ms1\\onlineshop.

    IF failed IS INITIAL.
      "Read changed data for action result
      READ ENTITIES OF zr_onlineshop_ms1 IN LOCAL MODE
        ENTITY onlineshop
          ALL FIELDS WITH
          CORRESPONDING #( keys )
        RESULT shopped_items
        FAILED DATA(failed_items)
        REPORTED DATA(reported_items).
      result = VALUE #( FOR shopped_item_2 IN shopped_items (
*                                                              OrderUUID = shopped_item_2-OrderUUID
                                                              %tky   = shopped_item_2-%tky
                                                              %param = shopped_item_2 ) ).
    ENDIF.

*

  ENDMETHOD.

  METHOD calculateorderid.
    DATA:
      orders TYPE TABLE FOR UPDATE zr_onlineshop_ms1,
      order  TYPE STRUCTURE FOR UPDATE zr_onlineshop_ms1.
*      delete from zorder_xxx UP TO 15 ROWS.
    SELECT MAX( orderid ) FROM zaonlineshop_ms1 INTO @DATA(max_order_id).
    READ ENTITIES OF zr_onlineshop_ms1 IN LOCAL MODE
       ENTITY onlineshop
        ALL FIELDS
          WITH CORRESPONDING #( keys )
          RESULT DATA(lt_order_result)
      FAILED    DATA(lt_failed)
      REPORTED  DATA(lt_reported).
*    DATA(today) = cl_abap_context_info=>get_system_date( ).

    LOOP AT lt_order_result INTO DATA(order_read).
      max_order_id += 1.
      GET TIME STAMP FIELD DATA(lv_timestamp).
      order               = CORRESPONDING #( order_read ).
      order-orderid      = max_order_id.
      APPEND order TO orders.
*      if orders is not initial.
*      zcl_ms1=>abap_sdk_read( orderid = order-orderid  ).
*      ENDIF.
    ENDLOOP.
    MODIFY ENTITIES OF zr_onlineshop_ms1 IN LOCAL MODE
   ENTITY onlineshop UPDATE FIELDS ( orderid ) WITH orders
   MAPPED   DATA(ls_mapped_modify)
   FAILED   DATA(lt_failed_modify)
   REPORTED DATA(lt_reported_modify).

* Call Code snippet for ABAP SDK



  ENDMETHOD.

  METHOD checkquantity.
    READ ENTITIES OF zr_onlineshop_ms1
    IN LOCAL MODE
    ENTITY onlineshop
    FIELDS ( quantity )
    WITH CORRESPONDING #( keys )
    RESULT DATA(online_shops)
    REPORTED DATA(online_shops_reported).

    LOOP AT online_shops INTO DATA(online_shop).
      IF online_shop-quantity IS INITIAL .
        APPEND VALUE #(  %tky = online_shop-%tky ) TO failed-onlineshop.
        APPEND VALUE #( %tky = online_shop-%tky
                        %msg = new_message_with_text(
                                 severity = if_abap_behv_message=>severity-error
                                 text     = 'Quantity cannot be initial'
                               ) ) TO reported-onlineshop.
      ELSEIF online_shop-quantity > 10 .
        APPEND VALUE #(  %tky = online_shop-%tky ) TO failed-onlineshop.
        APPEND VALUE #( %tky = online_shop-%tky
                        %msg = new_message_with_text(
                                 severity = if_abap_behv_message=>severity-error
                                 text     = 'Quantity cannot be more than 10'
                               ) ) TO reported-onlineshop.


      ENDIF.


    ENDLOOP.

  ENDMETHOD.
  METHOD checkdescription.
    READ ENTITIES OF zr_onlineshop_ms1
    IN LOCAL MODE
    ENTITY onlineshop
    FIELDS ( descriptiontext )
    WITH CORRESPONDING #( keys )
    RESULT DATA(online_shops)
    REPORTED DATA(online_shops_reported).

    LOOP AT online_shops INTO DATA(online_shop).
      IF online_shop-descriptiontext IS INITIAL.
        APPEND VALUE #(  %tky = online_shop-%tky ) TO failed-onlineshop.
        APPEND VALUE #( %tky = online_shop-%tky
                        %msg = new_message_with_text(
                                 severity = if_abap_behv_message=>severity-error
                                 text     = 'Description text cannot be initial'
                               ) ) TO reported-onlineshop.

      ENDIF.


    ENDLOOP.

  ENDMETHOD.



ENDCLASS.
