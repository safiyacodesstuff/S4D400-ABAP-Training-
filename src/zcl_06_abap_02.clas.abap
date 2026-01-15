CLASS zcl_06_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

     DATA customer_id TYPE /dmo/customer_id.
     DATA first_name TYPE /dmo/first_name.
     DATA last_name TYPE /dmo/last_name.
     DATA city TYPE /dmo/city.
     DATA country_code TYPE land1.

     customer_id = 19286.
     first_name = 'Bruce'.
     last_name = 'Wayne'.
     city = 'Gotham'.
     country_code = 'US'.

     out->write( customer_id && ',' && | | && first_name && ',' && | | && last_name && ',' &&  | | && city &&  ',' && | | && country_code ).


  ENDMETHOD.
ENDCLASS.
