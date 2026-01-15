CLASS zcl_06_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING id                   TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i
                        RAISING   zcx_abap_initial_parameter.

    METHODS to_string RETURNING VALUE(string) TYPE string.

    METHODS get_total_weight_in_tons RETURNING VALUE(total_weight_in_tons) TYPE i.

    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_created_airplanes TYPE i READ-ONLY.


  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_06_airplane IMPLEMENTATION.
  METHOD constructor.

    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( 'id' ).
    ELSEIF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( 'plane_type' ).
    ELSEIF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( 'empty_weight_in_tons' ).
    ENDIF.

    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.

    number_of_created_airplanes += 1.
  ENDMETHOD.

   METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * 110 / 100.
  ENDMETHOD.

  METHOD to_string.
    string = |{ id }, { plane_type } (Leergewicht: { empty_weight_in_tons }t, |.
  ENDMETHOD.

ENDCLASS.
