CLASS zcl_06_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA vehicle  TYPE REF TO zcl_06_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_06_vehicle.       " Einspaltige Tabelle

    " Instanziierungen
    out->write( zcl_06_vehicle=>number_of_created_vehicles ).

    vehicle = NEW zcl_06_car( make  = 'Porsche'
                              model = '911'
                              seats = 2 ).                   " Upcast
    APPEND vehicle TO vehicles.                              " Speicherung der Speicheradresse in Tabelle

    vehicle = NEW zcl_06_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ).        " Upcast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_06_car( make  = 'Skoda'
                              model = 'Superb Combi'
                              seats = 5 ).                   " Upcast
    APPEND vehicle TO vehicles.

    out->write( zcl_06_vehicle=>number_of_created_vehicles ).

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->brake( 10 ).
          vehicle->accelerate( 100 ).
        CATCH zcx_06_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      out->write( vehicle->to_string(  ) ).                  " (Dynamische) Polymorphie -> Zur Laufzeit wird entscheiden, welche Implementierung aufgerufen werden
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
