CLASS zcl_06_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Hello World
**********************************************************************

    DATA text TYPE string. " Deklaration
    text = 'Hello World'. " Wertzuweisung
* Ausgabe
    out->write( text ) .


**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************

    DATA age type i. " Ganze Zahlen
    DATA salary_in_euro type p length 16 decimals 2. " Kommazahlen
    DATA first_name type c length 40. " Zeichenketten fester Länge
    DATA matriculation_number type n length 7. " Ziffernfolge
    DATA xmas type d. " Datumsangaben
    DATA noon type t. " Zeitangaben
    DATA flag. " Kennzeichen der Länge eins ("X oder Nix")

    DATA carrier_id TYPE c LENGTH 3. " ABAP Standardtyp
    DATA carrier_id2 TYPE /dmo/carrier_id. " Datenelement

**********************************************************************
* Wertzuweisungen
**********************************************************************

* Zuweisungsoperator ("=")
    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Daniel'.
    matriculation_number = '9182643'.
    xmas = '20261224'.
    noon = '120000'.
    flag = 'X'.

    flag = ''.
    flag = ' '.
    clear flag.

* Statische Vorbelegung
    DATA last_name TYPE c LENGTH 40 VALUE 'Appenmaier'.

* Inlinedeklrationen
    data(size_in_cm) = 179. " Bei Inlinedeklarationen keine Leerzeichen nach Klammern
    size_in_cm = 179.


  ENDMETHOD.

ENDCLASS.
