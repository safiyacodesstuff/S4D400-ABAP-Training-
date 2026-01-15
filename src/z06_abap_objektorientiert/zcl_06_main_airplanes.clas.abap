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
    DATA airplane  TYPE REF TO zcl_06_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_06_airplane.       " Einspaltige Tabelle

    " Instanziierungen
    out->write( zcl_06_airplane=>number_of_created_airplanes ).

    TRY.
        airplane = NEW zcl_06_passenger_plane( id                   = 'D-ABUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 277
                                               number_of_seats      = 250 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).                            " Speicherung der Speicheradresse in Tabelle
    ENDTRY.

    TRY.
        airplane = NEW zcl_06_passenger_plane( id                   = 'D-AIND'
                                               plane_type           = 'Airbus A320-200'
                                               empty_weight_in_tons = 42
                                               number_of_seats      = 125 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(y).
        out->write( y->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_06_cargo_plane( id                   = 'D-AJKF'
                                           plane_type           = 'Boeing 747-400F'
                                           empty_weight_in_tons = 166
                                           cargo_in_tons        = 87 ).
        APPEND airplane TO airplanes.
      CATCH zcx_abap_initial_parameter INTO DATA(z).
        out->write( z->get_text( ) ).                            " Speicherung der Speicheradresse in Tabelle
    ENDTRY.

    out->write( zcl_06_airplane=>number_of_created_airplanes ).

    " Ausgabe
    LOOP AT airplanes INTO airplane.
      out->write( airplane->to_string( ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
