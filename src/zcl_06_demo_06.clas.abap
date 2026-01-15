CLASS zcl_06_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE z06_connection.
    DATA flight TYPE z06_flight.
    DATA flight_extended TYPE z06_flight_extended.

    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.

    flight-carrier_id = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date = '20260113'.

    flight_extended = CORRESPONDING #( flight ).   " # kopiert namensgleiche Komponenten
    flight_extended = CORRESPONDING #( BASE ( flight_extended ) connection ).  " base zur Vereinigung mehrerer Strukturen in einer

    out->write( connection-airport_from_id ).
    out->write( connection-airport_to_id ).
    out->write( connection-carrier_id ).
    out->write( connection-connection_id ).

    out->write( flight_extended ).                 " gibt alles in Tabellenform aus

  ENDMETHOD.
ENDCLASS.
