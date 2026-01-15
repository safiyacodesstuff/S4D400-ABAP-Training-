CLASS zcl_06_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA operand_1 TYPE p LENGTH 16 DECIMALS 2 VALUE 2.
    DATA operand_2 TYPE p LENGTH 16 DECIMALS 2 VALUE 5.
    DATA operator TYPE c LENGTH 2 VALUE '/'.
    DATA ergebnis TYPE p LENGTH 16 DECIMALS 2.

    CASE operator.
      WHEN '+'.
        ergebnis = operand_1 + operand_2.
        out->write( |{ operand_1 } { operator } { operand_2 } = { ergebnis }| ).
      WHEN '-'.
        ergebnis = operand_1 - operand_2.
        out->write( |{ operand_1 } { operator } { operand_2 } = { ergebnis }| ).
      WHEN '*'.
        ergebnis = operand_1 * operand_2.
      WHEN '/'.
        ergebnis = operand_1 / operand_2.
      WHEN '%'.
        ergebnis = zcl_06_calculator=>calculate_percentage(
                  percentage = conv #( operand_1 )
                  base = conv #( operand_2 )
                ).
      WHEN '^'.
        TRY.
            ergebnis = zcl_abap_calculator=>calculate_power(
                       exponent = conv #( operand_1 )
                       base = conv #( operand_2 )
                     ).
          CATCH zcx_abap_exponent_too_high.
            "handle exception
        ENDTRY.


    ENDCASE.

    out->write( |{ operand_1 } { operator } { operand_2 } = { ergebnis }| ).
    out->write( |{ operand_1 NUMBER = USER } { operator } { operand_2 NUMBER = USER } = { ergebnis NUMBER = USER }| ).


  ENDMETHOD.
ENDCLASS.
