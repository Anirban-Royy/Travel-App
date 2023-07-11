CLASS zcl_travel_ DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_travel_ IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  DELETE FROM zdbt1_travel.

*  DATA: IT_TRAVEL TYPE TABLE OF zdbt1_travel,
*        IT_BUS TYPE TABLE OF zdbt1_bus,
*        WA_BUS TYPE zdbt1_bus,
*        PRICEAFTERGST TYPE F.

*SELECT BUS_PRICE FROM zdbt1_bus WHERE busid = 'BID01' INTO @WA_BUS-bus_price .
*ENDSELECT.

*PRICEAFTERGST = ( wa_bus-bus_price * 5 ) / 100 .

*        IT_TRAVEL = VALUE #( (
*        travelid = 'TID01'
*        partnerid = 'PID01'
*        busid = 'BID01'
*        travel_date = '20231002'
*        final_price = PRICEAFTERGST + WA_BUS-BUS_PRICE
*         )
*          ).
*        insert zdbt1_travel from table @it_travel.
*        out->write( sy-dbcnt ).


*  DATA: IT2_TRAVEL TYPE TABLE OF zdbt1_travel,
*        IT2_BUS TYPE TABLE OF zdbt1_bus,
*        WA_BUS2 TYPE zdbt1_bus,
*        PRICEAFTERGST2 TYPE F.

*SELECT BUS_PRICE FROM zdbt1_bus WHERE busid = 'BID02' INTO @WA_BUS-bus_price .
*ENDSELECT.

*PRICEAFTERGST = ( wa_bus-bus_price * 5 ) / 100 .

*        IT_TRAVEL = VALUE #( (
*        travelid = 'TID02'
*        partnerid = 'PID02'
*        busid = 'BID02'
*        travel_date = '20231102'
*        final_price = PRICEAFTERGST + WA_BUS-BUS_PRICE
*         )
*          ).
*        insert zdbt1_travel from table @it_travel.
*        out->write( sy-dbcnt ).

  ENDMETHOD.
ENDCLASS.
