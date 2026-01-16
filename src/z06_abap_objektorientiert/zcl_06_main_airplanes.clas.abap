CLASS zcl_06_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA carrier TYPE REF TO zcl_06_carrier.
    DATA airplane  TYPE REF TO zcl_06_airplane.
    " DATA airplanes TYPE TABLE OF REF TO zcl_06_airplane.

    " Instanziierungen
    out->write( zcl_06_airplane=>number_of_created_airplanes ).

    carrier = NEW #( 'LUFTHANSA' ).

    TRY.
        airplane = NEW zcl_06_passenger_plane( id                   = 'D-ABUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 277
                                               number_of_seats      = 250 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_06_passenger_plane( id                   = 'D-AIND'
                                               plane_type           = 'Airbus A320-200'
                                               empty_weight_in_tons = 42
                                               number_of_seats      = 125 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_06_cargo_plane( id                   = 'D-AJKF'
                                           plane_type           = 'Boeing 747-400F'
                                           empty_weight_in_tons = 166
                                           cargo_in_tons        = 87 ).
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).
    ENDTRY.

    out->write( zcl_06_airplane=>number_of_created_airplanes ).

    " Ausgabe
    LOOP AT carrier->airplanes INTO airplane.
      out->write( airplane->to_string( ) ).
    ENDLOOP.
    out->write( carrier->get_biggest_cargo_plane(  ) ).
  ENDMETHOD.
ENDCLASS.
