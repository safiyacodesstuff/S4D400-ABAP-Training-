CLASS zcl_06_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data(customer) = zcl_abap_helper=>get_customer( customer_id = '699' ).

    out->write( customer ).


  ENDMETHOD.
ENDCLASS.
