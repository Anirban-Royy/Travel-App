CLASS zcl_bus DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bus IMPLEMENTATION.
 METHOD if_oo_adt_classrun~main.

  DELETE FROM zdbt1_bus.

  data: it_bus type table of zdbt1_bus.
        it_bus = value #(
        (
        busid = 'BID01'
        bus_source = 'Agra'
        bus_destination = 'Delhi'
        bus_price = '2570.50' )
        (
        busid = 'BID02'
        bus_source = 'Durgapur'
        bus_destination = 'Kolkata'
        bus_price = '635.00')
        ).
        insert zdbt1_bus from table @it_bus.
       out->write( sy-dbcnt ).
  ENDMETHOD.
ENDCLASS.
