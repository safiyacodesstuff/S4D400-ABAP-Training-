CLASS zcl_06_vehicle DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate IMPORTING !value TYPE i
                       RAISING   zcx_06_value_too_high.

    METHODS brake IMPORTING !value TYPE i
                  RAISING   zcx_06_value_too_high.

    METHODS to_string RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_created_vehicles TYPE i READ-ONLY.


  PROTECTED SECTION.


  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_06_vehicle IMPLEMENTATION.

  METHOD constructor.
    me->make = make.
    me->model = model.

    number_of_created_vehicles += 1.
  ENDMETHOD.


  METHOD accelerate.

    IF speed_in_kmh + value > 300.
      RAISE EXCEPTION NEW zcx_06_value_too_high( value = value ).
    ENDIF.

    speed_in_kmh += value.
  ENDMETHOD.


  METHOD brake.

    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_06_value_too_high( value = value ).
    ENDIF.

    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h|.
  ENDMETHOD.

ENDCLASS.
