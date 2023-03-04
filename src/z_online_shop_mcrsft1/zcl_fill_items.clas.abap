CLASS zcl_fill_items DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_items IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  delete from zitems.
    INSERT zitems FROM @( VALUE #( item = 'Laptop' price = '2000' curreny = 'EUR' product = 'TG10'  productgroup = 'L001' ) ).
    INSERT zitems FROM @( VALUE #( item = 'Desktop' price = '1500' curreny = 'EUR'  product = 'S-201'  productgroup = 'L003'   ) ).
    INSERT zitems FROM @( VALUE #( item = 'Table'  price = '800' curreny = 'EUR'  product = 'NL001'  productgroup = 'YBMM01'    ) ).
    INSERT zitems FROM @( VALUE #( item = 'Chair' price = '500' curreny = 'EUR' product = 'RM20'  productgroup = 'L002'    ) ).
    INSERT zitems FROM @( VALUE #( item = 'Printer' price = '300' curreny = 'EUR'  product = 'SM_PROD02'  productgroup = 'P001'   ) ).
*delete from zaonlineshop_u.
*delete from zdonlineshop_u.
  ENDMETHOD.
ENDCLASS.
