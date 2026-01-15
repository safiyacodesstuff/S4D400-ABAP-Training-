CLASS zcl_06_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(d) = zcl_09_helper=>get_travel_with_customer( '200' ).
    out->write( |Travel ID: { d-customer_id }| ).
    out->write( |Start: { d-begin_date DATE = USER }| ).
    out->write( |End: { d-end_date DATE = USER }| ).
    out->write( |Description: { d-description }| ).
    out->write( |Customer Id: { d-travel_id }| ).
    out->write( |Name: { d-first_name } { d-last_name }| ).
    out->write( |City: { d-city }| ).
    out->write( |Country: { d-country_code }| ).

  ENDMETHOD.
ENDCLASS.
