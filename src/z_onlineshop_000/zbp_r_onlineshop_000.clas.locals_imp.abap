CLASS lsc_zr_onlineshop_000 DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_onlineshop_000 IMPLEMENTATION.

  METHOD save_modified.

    DATA : lt_online_shop_as        TYPE STANDARD TABLE OF zaonlineshop_000,
           ls_online_shop_as        TYPE                   zaonlineshop_000,
           lt_online_shop_x_control TYPE STANDARD TABLE OF zaonlineshop_x_000.

    IF create-onlineshop IS NOT INITIAL.
      lt_online_shop_as = CORRESPONDING #( create-onlineshop MAPPING FROM ENTITY ).
      INSERT zaonlineshop_000 FROM TABLE @lt_online_shop_as.
    ENDIF.

    IF update IS NOT INITIAL.
      CLEAR lt_online_shop_as.
      lt_online_shop_as = CORRESPONDING #( update-onlineshop MAPPING FROM ENTITY ).
      lt_online_shop_x_control = CORRESPONDING #( update-onlineshop MAPPING FROM ENTITY ).
      MODIFY zaonlineshop_000 FROM TABLE @lt_online_shop_as.
    ENDIF.
    IF delete IS NOT INITIAL.
      LOOP AT delete-onlineshop INTO DATA(onlineshop_delete).
        DELETE FROM zaonlineshop_000 WHERE order_uuid = @onlineshop_delete-OrderUUID.
        DELETE FROM zdonlineshop_000 WHERE orderuuid = @onlineshop_delete-OrderUUID.
      ENDLOOP.
    ENDIF.


    IF zbp_r_onlineshop_000=>mapped_purchase_requisition IS NOT INITIAL AND update IS NOT INITIAL.
      LOOP AT zbp_r_onlineshop_000=>mapped_purchase_requisition-purchaserequisition ASSIGNING FIELD-SYMBOL(<fs_pr_mapped>).
        CONVERT KEY OF i_purchaserequisitiontp FROM <fs_pr_mapped>-%pid TO DATA(ls_pr_key).
        <fs_pr_mapped>-purchaserequisition = ls_pr_key-purchaserequisition.
      ENDLOOP.
      LOOP AT update-onlineshop INTO  DATA(ls_online_shop) WHERE %control-OverallStatus = if_abap_behv=>mk-on.
        " Creates internal table with instance data
        DATA(creation_date) = cl_abap_context_info=>get_system_date(  ).
        UPDATE zaonlineshop_000 SET purchase_requisition = @ls_pr_key-purchaserequisition,
                                    purch_rqn_creation_date = @creation_date WHERE order_uuid = @ls_online_shop-OrderUUID.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_handler DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF is_draft,
        false TYPE abp_behv_flag VALUE '00', " active (not draft)
        true  TYPE abp_behv_flag VALUE '01', " draft
      END OF is_draft.
    CONSTANTS:
      BEGIN OF c_overall_status,
        new            TYPE string VALUE 'New / Composing',
        new_code       TYPE int1   VALUE 2, "'New / Composing'
        submitted      TYPE string VALUE 'Submitted / Approved',
        submitted_code TYPE int1   VALUE 3, "'Submitted / Approved'
      END OF c_overall_status.

    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR OnlineShop
        RESULT result,
      calculateTotalPrice FOR DETERMINE ON MODIFY
        IMPORTING keys FOR OnlineShop~calculateTotalPrice,
      setInitialOrderValues FOR DETERMINE ON MODIFY
        IMPORTING keys FOR OnlineShop~setInitialOrderValues,
      updateProductDetails FOR DETERMINE ON MODIFY
        IMPORTING keys FOR OnlineShop~updateProductDetails,
      checkDeliveryDate FOR VALIDATE ON SAVE
        IMPORTING keys FOR OnlineShop~checkDeliveryDate.

    METHODS checkOrderedItem FOR VALIDATE ON SAVE
      IMPORTING keys FOR OnlineShop~checkOrderedItem.

    METHODS checkOrderedQuantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR OnlineShop~checkOrderedQuantity.
    METHODS createPurchaseRequisition FOR MODIFY
      IMPORTING keys FOR ACTION OnlineShop~createPurchaseRequisition RESULT result.
ENDCLASS.

CLASS lcl_handler IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD calculateTotalPrice.
    DATA total_price TYPE ZR_OnlineShop_000-TotalPrice.

    " read transfered instances via EML
    READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        FIELDS ( OrderID TotalPrice OrderItemPrice OrderItemQuantity )
        WITH CORRESPONDING #( keys )
      RESULT DATA(OnlineShops).

    " abap logic
    LOOP AT OnlineShops ASSIGNING FIELD-SYMBOL(<OnlineShop>).
      " calculate total value
      <OnlineShop>-TotalPrice = <OnlineShop>-OrderItemPrice * <OnlineShop>-OrderItemQuantity.
    ENDLOOP.

    "update instances via EML
    MODIFY ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        UPDATE FIELDS ( TotalPrice )
        WITH VALUE #( FOR OnlineShop IN OnlineShops (
                           %tky       = OnlineShop-%tky
                           TotalPrice = OnlineShop-TotalPrice
                        ) ).
  ENDMETHOD.

  METHOD setInitialOrderValues.
    DATA delivery_date TYPE I_PurchaseReqnItemTP-DeliveryDate.

    "read transfered instances via EML
    READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        FIELDS ( OrderID OverallStatus DeliveryDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(OnlineShops).

    "delete entries with assigned order ID
    DELETE OnlineShops WHERE OrderID IS NOT INITIAL.
    CHECK OnlineShops IS NOT INITIAL.

    " ** ABAP logic to determine order IDs and delivery date**

    " get max order ID from the relevant active and draft table entries
    SELECT MAX( order_id ) FROM zaonlineshop_000 INTO @DATA(max_order_id). "active table
    SELECT SINGLE FROM zdonlineshop_000 FIELDS MAX( orderid ) INTO @DATA(max_orderid_draft). "draft table
    IF max_orderid_draft > max_order_id.
      max_order_id = max_orderid_draft.
    ENDIF.

    "set delivery date proposal
    cl_scal_api=>date_compute_day(
        EXPORTING
          iv_date           = cl_abap_context_info=>get_system_date(  )
        IMPORTING
          ev_weekday_number = DATA(weekday_number)
          ev_weekday_name = DATA(weekday_name)
         ).
    CASE weekday_number.
      WHEN 6.
        delivery_date = cl_abap_context_info=>get_system_date(  ) + 16.
      WHEN 7.
        delivery_date = cl_abap_context_info=>get_system_date(  ) + 15.
      WHEN OTHERS.
        delivery_date = cl_abap_context_info=>get_system_date(  ) + 14.
    ENDCASE.


    "set initial values of new instances via EML
    MODIFY ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        UPDATE FIELDS ( OrderID OverallStatus DeliveryDate OrderItemPrice )
        WITH VALUE #( FOR OnlineShop IN OnlineShops INDEX INTO i (
                           %tky           = OnlineShop-%tky
                           OrderID        = max_order_id + i
                           OverallStatus  = c_overall_status-new  "'New / Composing'
                           DeliveryDate   = delivery_date
                        ) ).
  ENDMETHOD.

  METHOD updateProductDetails.
    "read transfered instances
    READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        FIELDS ( OrderItemID )
        WITH CORRESPONDING #( keys )
      RESULT DATA(OnlineShops).

    "read and set product details
    LOOP AT OnlineShops ASSIGNING FIELD-SYMBOL(<OnlineShop>).
      "read and set relevant product information
      SELECT SINGLE * FROM zi_product_vh_reuse WHERE product = @<OnlineShop>-OrderItemID INTO @DATA(product).
      <OnlineShop>-OrderItemPrice = product-price.
      <OnlineShop>-Currency       = product-Currency.
    ENDLOOP.

    "update instances
    MODIFY ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        UPDATE FIELDS ( OrderItemPrice Currency )
        WITH VALUE #( FOR OnlineShop IN OnlineShops INDEX INTO i (
                           %tky           = OnlineShop-%tky
                           OrderItemPrice = OnlineShop-OrderItemPrice
                           Currency       = OnlineShop-Currency
                        ) ).
  ENDMETHOD.


  METHOD checkdeliverydate.

    READ ENTITIES OF zr_onlineshop_000 IN LOCAL MODE
      ENTITY OnlineShop
        FIELDS ( DeliveryDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(OnlineOrders).

    DATA(today_date) = cl_abap_context_info=>get_system_date(  ).

    LOOP AT OnlineOrders INTO DATA(online_order).

      cl_scal_api=>date_compute_day(
           EXPORTING
             iv_date           = online_order-DeliveryDate
           IMPORTING
             ev_weekday_number = DATA(weekday_number)
             ev_weekday_name = DATA(weekday_name)
             ).

      "raise msg if no delivery date is selected
      IF online_order-DeliveryDate IS INITIAL OR online_order-DeliveryDate = ' '.
        APPEND VALUE #( %tky         = online_order-%tky
                        %msg         = new_message_with_text(
                                            severity = if_abap_behv_message=>severity-error
                                            text     = 'Select a delivery date' )
                        %element-deliverydate  = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.

        "raise msg if selected delivery date is less than 14 days from today
      ELSEIF  ( ( online_order-DeliveryDate ) - today_date ) < 14.
        APPEND VALUE #(  %tky         = online_order-%tky
                         %msg         = new_message_with_text(
                                             severity     = if_abap_behv_message=>severity-error
                                             text         = |Delivery date must be at least 14 days from today.|  )
                         %element-deliverydate  = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.
      ELSEIF weekday_number = 5 OR weekday_number = 6.
        APPEND VALUE #(  %tky          = online_order-%tky
                         %msg          = new_message_with_text(
                         severity = if_abap_behv_message=>severity-error
                         text     = | No delivery on a weekend ({ weekday_name })|  )
                         %element-deliverydate  = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD checkOrderedItem.
    "read relevant order instance data
    READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
    ENTITY OnlineShop
     FIELDS ( OrderID OrderItemID )
     WITH CORRESPONDING #( keys )
    RESULT DATA(OnlineShops).

    DATA products TYPE SORTED TABLE OF zi_product_vh_reuse WITH UNIQUE KEY Product.

    "optimization of DB select: extract distinct non-initial product IDs
    products = CORRESPONDING #( OnlineShops DISCARDING DUPLICATES MAPPING Product = OrderItemID EXCEPT * ).
    DELETE products WHERE Product IS INITIAL.

    IF products IS NOT INITIAL.
      "check if product ID exists
      SELECT FROM zi_product_vh_reuse FIELDS product
                                FOR ALL ENTRIES IN @OnlineShops
                                WHERE product = @OnlineShops-OrderItemID
        INTO TABLE @DATA(valid_ordereditem).
    ENDIF.

    "raise msg for non existing and initial order id
    LOOP AT OnlineShops INTO DATA(OnlineShop).
*      APPEND VALUE #(  %tky                 = OnlineShop-%tky
*                     ) TO reported-onlineshop.

      IF OnlineShop-OrderItemID IS  INITIAL.
        APPEND VALUE #( %tky         = OnlineShop-%tky ) TO failed-onlineshop.
        APPEND VALUE #( %tky         = OnlineShop-%tky
                         %msg         = new_message_with_text(
                                             severity     = if_abap_behv_message=>severity-error
                                             text         = |Select the product to be ordered|  )
                        %element-orderitemid = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.

      ELSEIF OnlineShop-OrderItemID IS NOT INITIAL AND NOT line_exists( valid_ordereditem[ product = OnlineShop-OrderItemID ] ).
        APPEND VALUE #(  %tky = OnlineShop-%tky ) TO failed-onlineshop.

        APPEND VALUE #(  %tky                 = OnlineShop-%tky
                         %msg         = new_message_with_text(
                                             severity     = if_abap_behv_message=>severity-error
                                             text         = |Product unknown|  )
                         %element-orderitemid = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD checkOrderedQuantity.
    "read relevant order instance data
    READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
    ENTITY OnlineShop
     FIELDS ( OrderID OrderItemID OrderItemQuantity )
     WITH CORRESPONDING #( keys )
    RESULT DATA(OnlineShops).

    "raise msg if 0 > qty <= 10
    LOOP AT OnlineShops INTO DATA(OnlineShop).

      IF OnlineShop-OrderItemQuantity IS INITIAL OR OnlineShop-OrderItemQuantity = ' '
         OR OnlineShop-OrderItemQuantity <= 0.
        APPEND VALUE #( %tky          = OnlineShop-%tky
                        %msg         = new_message_with_text(
                                             severity     = if_abap_behv_message=>severity-error
                                             text         = |Enter a valid quantity (up to 10)|  )
                        %element-orderitemquantity = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.

      ELSEIF OnlineShop-OrderItemQuantity > 10.
        APPEND VALUE #(  %tky          = OnlineShop-%tky
                         %msg         = new_message_with_text(
                                             severity     = if_abap_behv_message=>severity-error
                                             text         = |More than 10 items cannot be ordered|  )
                         %element-orderitemquantity  = if_abap_behv=>mk-on
                      ) TO reported-onlineshop.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD createPurchaseRequisition.

    DATA: purchase_requisitions      TYPE TABLE FOR CREATE I_PurchaserequisitionTP,
          purchase_requisition       TYPE STRUCTURE FOR CREATE I_PurchaserequisitionTP,
          purchase_requisition_items TYPE TABLE FOR CREATE i_purchaserequisitionTP\_PurchaseRequisitionItem,
          purchase_requisition_item  TYPE STRUCTURE FOR CREATE i_purchaserequisitiontp\\purchaserequisition\_purchaserequisitionitem,
          purchase_reqn_acct_assgmts TYPE TABLE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnAcctAssgmt,
          purchase_reqn_acct_assgmt  TYPE STRUCTURE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnAcctAssgmt,
          purchase_reqn_item_texts   TYPE TABLE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnItemText,
          purchase_reqn_item_text    TYPE STRUCTURE FOR CREATE I_PurchaseReqnItemTP\_PurchaseReqnItemText,
          update_lines               TYPE TABLE FOR UPDATE ZR_OnlineShop_000\\OnlineShop,
          update_line                TYPE STRUCTURE FOR UPDATE ZR_OnlineShop_000\\OnlineShop,
          purchase_order_description TYPE c LENGTH 40.

    "read transfered order instances
    READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        ALL FIELDS WITH
        CORRESPONDING #( keys )
      RESULT DATA(OnlineShops).

    "delete instances with assigned purchase rqn number
    DELETE OnlineShops WHERE PurchaseRequisition IS NOT INITIAL.
    CHECK OnlineShops IS NOT INITIAL.

    DATA n TYPE i.
    LOOP AT OnlineShops INTO DATA(OnlineShop).
      n += 1.

      purchase_order_description = | OnlineShop - { OnlineShop-OrderID  } |.

      "purchase requisition
      purchase_requisition = VALUE #(  %cid                      = |My%CID_{ n }|
                                        purchaserequisitiontype  = 'NB'
                                        PurReqnDescription = purchase_order_description
                                         ) .
      APPEND purchase_requisition TO purchase_requisitions.

      "purchase requisition item
      purchase_requisition_item = VALUE #(
                                         %cid_ref = |My%CID_{ n }|
                                         %target  = VALUE #(  (
                                                       %cid                         = |My%ItemCID_{ n }|
                                                       plant                        = '1010'  "Plant 01 (DE)
                                                       accountassignmentcategory    = 'U'  "unknown
*                                                       PurchaseRequisitionItemText  = OnlineShop-ProductText.  "info automatically retrieved from I_Product
                                                       requestedquantity            = OnlineShop-OrderItemQuantity
                                                       baseunit                     = OnlineShop-BaseUnit
                                                       purchaserequisitionprice     = OnlineShop-OrderItemPrice
                                                       purreqnitemcurrency          = OnlineShop-Currency
                                                       Material                     = OnlineShop-OrderItemID
                                                       materialgroup                = OnlineShop-ProductGroup
                                                       purchasinggroup              = '001'
                                                       purchasingorganization       = '1010'
                                                       DeliveryDate                 = OnlineShop-DeliveryDate   "format: yyyy-mm-dd (at least 10 days)
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
      purchase_reqn_item_text =  VALUE #(
                                          %cid_ref = |My%ItemCID_{ n }|
                                          %target  = VALUE #( (
                                                       %cid           = |My%TextCID_{ n }|
                                                       textobjecttype = 'B01'
                                                       language       = 'E'
                                                       plainlongtext  = OnlineShop-Notes
                                                   )  )  ) .
      APPEND purchase_reqn_item_text TO purchase_reqn_item_texts.
    ENDLOOP.

    "create the purchase requisitions
    IF OnlineShops IS NOT INITIAL.
      "purchase requisition
      MODIFY ENTITIES OF i_purchaserequisitiontp
        ENTITY purchaserequisition
          CREATE FIELDS ( purchaserequisitiontype )
          WITH purchase_requisitions
        "purchase requisition item
        CREATE BY \_purchaserequisitionitem
          FIELDS ( plant
                   accountassignmentcategory
*                   purchaserequisitionitemtext
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
                     BaseUnit )
            WITH purchase_reqn_acct_assgmts
        "purchase reqn item text
        CREATE BY \_purchasereqnitemtext
            FIELDS ( plainlongtext )
            WITH purchase_reqn_item_texts
      REPORTED DATA(reported_create_pr)
      MAPPED   DATA(mapped_create_pr)
      FAILED   DATA(failed_create_pr).
    ENDIF.

    "retrieve the generated
    zbp_r_onlineshop_000=>mapped_purchase_requisition-purchaserequisition = mapped_create_pr-purchaserequisition.

    "set a flag to check in the save sequence that purchase requisition has been created
    "the correct value for PurchaseRequisition has to be calculated in the save sequence using convert key
    LOOP AT keys INTO DATA(key).
      IF line_exists( onlineshops[ OrderUUID = key-OrderUUID ] ).
*        update_line-DirtyFlag              = abap_true.
        update_line-%tky                   = key-%tky.
        update_line-OverallStatus          = c_overall_status-submitted. "'Submitted / Approved'.
        update_line-OverallStatusIndicator = c_overall_status-submitted_code. "3.
        update_line-PurchRqnCreationDate   = cl_abap_context_info=>get_system_date(  ).
        APPEND update_line TO update_lines.
      ENDIF.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
      ENTITY OnlineShop
        UPDATE
*        FIELDS ( DirtyFlag OverallStatus OverallStatusIndicator PurchRqnCreationDate )
        FIELDS ( OverallStatus OverallStatusIndicator PurchRqnCreationDate )
        WITH update_lines
      REPORTED reported
      FAILED failed
      MAPPED mapped.

    IF failed IS INITIAL.
      "Read the changed data for action result
      READ ENTITIES OF ZR_OnlineShop_000 IN LOCAL MODE
        ENTITY OnlineShop
          ALL FIELDS WITH
          CORRESPONDING #( keys )
        RESULT DATA(result_read).
      "return result entities
      result = VALUE #( FOR result_order IN result_read ( %tky   = result_order-%tky
                                                          %param = result_order ) ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
