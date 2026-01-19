CLASS zcl_06_carrier DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_06_partner.

    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE Z06_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING
        name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_06_airplane.    " Referenz auf Flugzeug

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_06_cargo_plane.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_carrier IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.

    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_06_cargo_plane
      AND airplane->get_total_weight_in_tons( ) > max_cargo_in_tons.
        biggest_cargo_plane = CAST #( airplane ).
        max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons(  ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_06_partner~to_string.
    string = 'Ich bin die Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.
