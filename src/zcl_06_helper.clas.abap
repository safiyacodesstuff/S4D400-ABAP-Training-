CLASS zcl_06_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING
                zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z06_travels
      RAISING
                zcx_abap_no_data.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_helper IMPLEMENTATION.

  METHOD get_travel_with_customer.

    " Lösung aus Übungsaufgabe 6:

    " DATA(travel) = zcl_abap_helper=>get_travel( travel_id ).
    " DATA(customer) = zcl_abap_helper=>get_customer( customer_id = travel-customer_id ).
    " travel_with_customer = CORRESPONDING #( travel ).
    " travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

    " lösung aus Übungsaufgabe 9:

    " Möglichkeit 1:
    SELECT SINGLE FROM /dmo/travel
      FIELDS *
      WHERE travel_id = @travel_id
      INTO @DATA(travel).

    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table = '/DMO/TRAVEL' value = CONV #( travel-customer_id ) ).
    ENDIF.

    SELECT SINGLE FROM /dmo/customer
      FIELDS *
      WHERE customer_id = @travel-customer_id
      INTO @DATA(customer).

    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table = '/DMO/TRAVEL' value = CONV #( travel-customer_id ) ).
    ENDIF.


    " Möglichkeit 2:
    SELECT SINGLE FROM /dmo/travel
      INNER  JOIN /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS *
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.

      IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'TRAVEL_ID' table = '/DMO/TRAVEL' value = CONV #( travel_id ) ).
    ENDIF.

  ENDMETHOD.

  METHOD get_travels.

    " Lösung aus Übungsaufgabe 7:

    " travels = zcl_abap_helper=>get_travels( customer_id ).

    " Lösung aus übungsaufgabe 9:
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.

    IF sy-subrc <> 0.    "IF lines( travels ) = 0.    " IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'CUSTOMER_ID' table = '/DMO/TRAVEL' value = CONV #( customer_id ) ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
