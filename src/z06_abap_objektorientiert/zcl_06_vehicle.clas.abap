CLASS zcl_06_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate IMPORTING !value TYPE i
                       RAISING
                         zcx_06_value_too_high.
    METHODS brake      IMPORTING !value TYPE i
                       RAISING
                         zcx_06_value_too_high.

*    METHODS get_make         RETURNING VALUE(make)         TYPE string.
*    METHODS get_model        RETURNING VALUE(model)        TYPE string.
*    METHODS set_model        IMPORTING model               TYPE string.
*    METHODS get_speed_in_kmh RETURNING VALUE(speed_in_kmh) TYPE i.
*    METHODS set_speed_in_kmh IMPORTING speed_in_kmh        TYPE i.

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

ENDCLASS.
