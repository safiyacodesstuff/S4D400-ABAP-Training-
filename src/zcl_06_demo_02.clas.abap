CLASS zcl_06_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA result_i TYPE i.
    DATA result_p TYPE p LENGTH 8 DECIMALS 2.

    " Mathematische Operatoren
    result_i = 5 + 3.
    out->write( result_i ).

    result_i = 5 - 3.
    out->write( result_i ).

    result_i = 5 * 3.
    out->write( result_i ).

    result_i = 5 / 3.
    out->write( result_i ).

    result_p = 5 / 3.
    out->write( result_p ).

    result_i = 5 DIV 3.       " oder auch: result_i = 5 DIV 3
    out->write( result_i ).

    result_i = 5 MOD 3.       " oder auch: result_i = 5 MOD 3
    out->write( result_i ).

    result_i = 5 ** 3.
    out->write( result_i ).

    result_i = result_i + 1.
    out->write( result_i ).

    result_i += 1.
    out->write( result_i ).

    ADD 1 TO result_i.        " funktioniert auch mit negativeb Zahlen
    out->write( result_i ).

    " Numerische Funktionen
    result_i = sqrt( 81 ).
    out->write( result_i ).

    out->write( round( val = '47.895' dec = 2 ) ).


  ENDMETHOD.
ENDCLASS.
