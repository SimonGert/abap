CLASS zsg_cl_abap_basics_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsg_cl_abap_basics_main IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    out->write( 'Hello World' ).

    DATA lv_string TYPE string.
    lv_string = 'String'.
*    out->write( lv_string ).


    DATA lv_date TYPE d.
    lv_date = '20251009'.
*    out->write( lv_date ).

    DATA lv_time TYPE t.
    lv_time = '123456'.
*    out->write( lv_time ).

    DATA lv_integer TYPE i.
    lv_integer = 999.
*    out->write( lv_integer ).

******Arithmetische Ausdrücke

    DATA: lv_num1, lv_num2, lv_result TYPE i.

    lv_num1 = 5.
    lv_num2 = 3.

    lv_result = lv_num1 + lv_num2.

*      out->write( lv_result ).


*******IF-Anweisung

    IF lv_result = 0.
      out->write( 'Ja ist null' ).
    ELSE.
*      out->write( 'Nein, ist nicht null' ).
    ENDIF.


*****CASE

    DATA lv_string1 TYPE string.
    lv_string1 = 'DHBW'.
    CASE lv_string1.
      WHEN 'Hello World!'.
        out->write( 'Hello World!' ).
      WHEN 'DHBW'.
*        out->write( 'DHBW' ).
      WHEN OTHERS.
        out->write( 'Alles andere' ).
    ENDCASE.



*****DO-SCHLEIFEN

    DATA lv_testnumb1 TYPE i.
    lv_testnumb1 = 1.
    DO.
      IF lv_testnumb1 NOT BETWEEN 0 AND 10.
        EXIT.
      ENDIF.
*      out->write( lv_testnumb1 ).
      ADD 1 TO lv_testnumb1.
    ENDDO.
    lv_testnumb1 = 1.

*****WHILE-SCHLEIFE
    WHILE lv_testnumb1 < 10.
      ADD 2 TO lv_testnumb1.
*      out->write( lv_testnumb1 ).
    ENDWHILE.


**********************


    TYPES: BEGIN OF ts_meinstrukturtyp,
             carid            TYPE String,
             manufacturer     TYPE string,
             model            TYPE string,
             fuel_consumption TYPE p DECIMALS 2 LENGTH 2,
             price            TYPE i,
           END OF ts_meinstrukturtyp.

    DATA is_meinestruktur TYPE ts_meinstrukturtyp.
    is_meinestruktur-carid = '001'.
    is_meinestruktur-manufacturer = 'Audi'.
    is_meinestruktur-model = 'A4'.
    is_meinestruktur-fuel_consumption = '7.55'.
    is_meinestruktur-price = '50000'.

*    out->write( is_meinestruktur ).




*****Interne Tabelle

    TYPES tt_cars TYPE STANDARD TABLE OF ts_meinstrukturtyp WITH KEY carid.
    DATA lt_car TYPE tt_cars.

    DATA ls_car1 LIKE LINE OF lt_car.
    DATA ls_car2 LIKE LINE OF lt_car.
    DATA ls_car3 LIKE LINE OF lt_car.

    ls_car1-carid = '001'.
    ls_car1-manufacturer = 'Audi'.
    ls_car1-model = 'A4'.
    ls_car1-fuel_consumption = '7.55'.
    ls_car1-price = 50000.

    ls_car2-carid = '002'.
    ls_car2-manufacturer = 'BMW'.
    ls_car2-model = 'M3'.
    ls_car2-fuel_consumption = '9.99'.
    ls_car2-price = 47000.

    ls_car3-carid = '003'.
    ls_car3-manufacturer = 'Mercedes'.
    ls_car3-model = 'C-Klasse'.
    ls_car3-fuel_consumption = '7.8'.
    ls_car3-price = 70000.

    INSERT ls_car1 INTO TABLE lt_car.
    INSERT ls_car2 INTO TABLE lt_car.
    INSERT ls_car3 INTO TABLE lt_car.

*    out->write( lt_car ).


    DATA lo_car1 TYPE REF TO zsg_cl_car.
    CREATE OBJECT lo_car1.

    DATA lo_car2 LIKE lo_car1.
    CREATE OBJECT lo_car2.

    lo_car1->set_type(  iv_marke = 'BMW' iv_model = '330 i' ).
    lo_car1->set_production_date(  iv_production_date = '20190922' ).
    lo_car1->set_horsepower(  iv_horsepower = 252 ).
    lo_car1->set_price(  iv_price = 40000 ).

    lo_car2->set_type(  iv_marke = 'Mercedes-Benz' iv_model = ' C43 AMG' ).
    lo_car2->set_production_date(  iv_production_date = '20170504' ).
    lo_car2->set_horsepower(  iv_horsepower = 367 ).
    lo_car2->set_price(  iv_price = 43000 ).

    out->write(  lo_car1->display_attributes(  ) ).
    out->write(  lo_car2->display_attributes(  ) ).


    DATA lt_cars TYPE TABLE OF REF TO zsg_cl_car.

    APPEND lo_car1 TO lt_cars.
    APPEND lo_car2 TO lt_cars.

    LOOP AT lt_cars INTO DATA(ls_Cars).
      out->write( ls_cars->display_attributes(  ) ).
    ENDLOOP.


    DATA lo_car3 TYPE REF TO zsg_cl_car_c.
    CREATE OBJECT lo_car3
      EXPORTING
        iv_marke           = 'Volkswagen'
        iv_model           = 'Golf'
        iv_production_date = '20220909'
        iv_horsepower      = 105
        iv_price           = 27000.

    out->write(  lo_car3->display_attributes( ) ).

    DATA lo_car4 LIKE lo_car3.
    DATA lo_truck TYPE REF TO zsg_cl_truck.

    CREATE OBJECT lo_car4
      EXPORTING
        iv_marke           = 'Opel'
        iv_model           = 'Insignia'
        iv_production_date = '20200525'
        iv_horsepower      = 330
        iv_price           = 65000.

    CREATE OBJECT lo_truck
      EXPORTING
        iv_marke           = 'DAF'
        iv_model           = 'XF Euro6'
        iv_production_date = '20171105'
        iv_horsepower      = 400
        iv_price           = 125000.

        out->write(  lo_car4->zsg_if_vehicle~play_sound( ) ).
        out->write(  lo_truck->zsg_if_vehicle~play_sound( ) ).


  ENDMETHOD.
ENDCLASS.
