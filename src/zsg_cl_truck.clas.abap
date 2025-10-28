CLASS zsg_cl_truck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS display_attributes RETURNING VALUE(attributes) TYPE string.

    METHODS constructor IMPORTING iv_marke           TYPE string
                                  iv_model           TYPE string
                                  iv_production_date TYPE i
                                  iv_horsepower      TYPE i
                                  iv_price           TYPE i.

    INTERFACES zsg_if_vehicle.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_marke TYPE string.
    DATA mv_model TYPE string.
    DATA mv_production_date TYPE d.
    DATA mv_horsepower TYPE i.
    DATA mv_price TYPE i.
ENDCLASS.



CLASS zsg_cl_truck IMPLEMENTATION.
  METHOD constructor.
    mv_marke = iv_marke.
    mv_model = iv_model.
    mv_production_date = iv_production_date.
    mv_horsepower = iv_horsepower.
    mv_price = iv_price.
  ENDMETHOD.


  METHOD display_attributes.
    attributes = |{ 'Marke:' } { mv_marke } { 'Model:' } { mv_model } { 'Production Date:' } { mv_production_date } { 'Horsepower:' } { mv_horsepower } { 'Price:' } { mv_price }|.
  ENDMETHOD.

  METHOD zsg_if_vehicle~play_sound.
    rv_result = 'Truck sounds'.
  ENDMETHOD.

ENDCLASS.
