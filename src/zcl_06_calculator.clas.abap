CLASS zcl_06_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING operand_1     TYPE z06_decimal
                operand_2     TYPE z06_decimal
      RETURNING VALUE(result) TYPE z06_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS calculate_percentage
      IMPORTING base                    TYPE z06_decimal
                percentage              TYPE z06_decimal
      RETURNING VALUE(percentage_value) TYPE z06_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_calculator IMPLEMENTATION.

  METHOD divide.
    IF operand_2 IS INITIAL.           " IF operand2 = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand_1 / operand_2.     " würde auch mit return operand1 / operand2 funktionieren
  ENDMETHOD.

  METHOD calculate_percentage.
    percentage_value = base * ( percentage / 100 ).
  ENDMETHOD.

ENDCLASS.
