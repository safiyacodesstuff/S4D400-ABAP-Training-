CLASS zcl_06_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    " Endlosschleife mit Exitpoint
    DO.
      out->write( sy-index ).
      IF sy-index = 10.
        EXIT.
      ENDIF.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
