CLASS zcl_06_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_06_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string
        seats TYPE i.

    METHODS to_string REDEFINITION.



  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_06_car IMPLEMENTATION.

  METHOD constructor.

    super->constructor( make = make model = model ).        " super->constructor wichtig, weil viellicht wichtige Sachen implementiert

    me->seats = seats.

  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h, { seats } Sitzplätze)|.
  ENDMETHOD.

ENDCLASS.
