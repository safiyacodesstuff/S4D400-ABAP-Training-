CLASS zcl_06_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Deklaration interne Tabellen
    DATA connections TYPE z06_connections.           " TYPE [Tabellentyp]
    DATA connections2 TYPE TABLE OF z06_connection.  " TYPE TABLE OF [Strukturtyp]
    DATA connection TYPE z06_connection.

    " Hinzufügen von Datensaätzen
    connections = VALUE #(
    ( carrier_id = 'LH'  connection_id = '0400' )
    ( carrier_id = 'LH' airport_from_id = 'FRA' )
    ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    " Anfügen von Datensätzen
    connection = VALUE #( carrier_id = 'AZ' connection_id = '0017' airport_from_id = 'BER' airport_to_id = 'ROM' ).
    connections = VALUE #( ( connection ) ).         " Überschreibt Tabelle
    connections = VALUE #( BASE connections ( connection ) ). " moderne Variante
    APPEND connection TO connections.                " alte Variante

    " Lesen von Einzelsätzen
    TRY.
        connection = connections[ 3 ].                   " per Index (1-indizierte Sprache!!)
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ].  " per Schlüsselkomponente
    ENDIF.

    " Lesen mehrerer Datensätze
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.     " LOOP AT connections INTO DATA(connection2).
      out->write( connection ).                                 " Einfache Aufgabe jeder Zeile
      out->write( |{ sy-tabix } { connection-carrier_id }| ).   " Ausgabe mit Tabellen Index
    ENDLOOP.

**********************************************************************************

    " Ändern von Einzelsätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'.    " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'. " per Schlüsselkomponente
    ENDIF.

    " Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    " Löschen
    DELETE connections WHERE airport_from_id = 'FRA'.

    " Ändern mehrerer Datensätze (per SY-TABIX)
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    " Ändern mehrerer Datensätze (per Datenreferenz)
    DATA connection2 TYPE REF TO z00_connection.
    LOOP AT connections REFERENCE INTO connection2.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.

    " Ändern mehrerer Datensätze (per Feldsymbol)
    FIELD-SYMBOLS <connection> TYPE z06_connection.
    LOOP AT connections ASSIGNING <connection>.
      <connection>-carrier_id = 'LH'.
    ENDLOOP.

    " Anzahl Datensätze
    out->write( lines( connections ) ).

    " Ausgabe
    out->write( connections ).


  ENDMETHOD.
ENDCLASS.
