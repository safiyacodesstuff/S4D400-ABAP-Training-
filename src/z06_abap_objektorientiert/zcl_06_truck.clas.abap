CLASS zcl_06_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_06_vehicle

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS to_string REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_truck IMPLEMENTATION.

  METHOD constructor.

    super->constructor( make = make model = model ).

    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.

  METHOD to_string.
    string = super->to_string( ).
    string &&= |, Frachtkapazität: { cargo_in_tons }t)|.
  ENDMETHOD.

ENDCLASS.
