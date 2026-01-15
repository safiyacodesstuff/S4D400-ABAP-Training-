CLASS zcl_06_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
    DATA connection TYPE /dmo/connection.
    DATA connections TYPE TABLE OF /dmo/connection.
    DATA connection3 TYPE z06_connection.


    " SELECT [Spalten] FROM [Datenbanktabelle] WHERE [Bedingungen] --> normaler SQL Standard

    " Lesen von Einzelsätzen

    SELECT SINGLE FROM /dmo/connection
      FIELDS *                                                  " * bedeutet lies alle Spalten
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.

    out->write( connection ).


    " SELECT...ENDSELECT

    " Lesen mehrerer Datensätze (per Array Fetch)
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

    out->write( connections ).


    " Lesen mehrerer Datensätze (per Select-Schleife)
    CLEAR connections.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection.
      APPEND connection TO connections.
    ENDSELECT.

    out->write( connections ).


    " Definition der Zielvariablen (Option 1: Inlinedeklaration)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @DATA(connection2).

    out->write( connection2 ).


    " Definition der Zielvariablen (Option 2: Angabe passender Felder)
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection3.

    out->write( connection3 ).


    " Definition der Zielvariablen (Option 3: Kopieren namensgleicher Felder)
    SELECT SINGLE FROM /dmo/connection
      FIELDS client, carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection ).


    " Definition von Tabellen-Joins
    SELECT FROM /dmo/connection
      INNER JOIN /dmo/carrier ON /dmo/connection~carrier_id = /dmo/carrier~carrier_id
      FIELDS /dmo/connection~connection_id, /dmo/carrier~name
      INTO TABLE @DATA(connections2).

    out->write( connections2 ).

    " Datenbankänderungen
    connection-connection_id = '6666'.
    INSERT /dmo/connection FROM @connection.

    connection-distance = 1.
    connection-distance_unit = 'KM'.
    UPDATE /dmo/connection FROM @connection.

    connection-connection_id = '0402'.
    DELETE /dmo/connection FROM @connection.


  ENDMETHOD.
ENDCLASS.
