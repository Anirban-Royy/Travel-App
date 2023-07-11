CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS valbusid FOR VALIDATE ON SAVE
      IMPORTING keys FOR travel~valbusid.
    METHODS updateFinalPrice FOR DETERMINE ON MODIFY
      IMPORTING Keys FOR Travel~updateFinalPrice.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD valBusID.
*DATA it_busid type table of zdi_bus WITH KEY BusID.
*for BUSID
  READ ENTITIES OF zdi_travel IN LOCAL MODE ENTITY Travel FIELDS ( Busid )
  with CORRESPONDING #( keys ) RESULT DATA(busidKey).

 loop at busidkey into data(ls_busid).
  select from zdi_bus FIELDS BusID where BusID = @ls_busid-Busid into table @data(it_busidKey).
  if it_busidkey is initial.
  data(message) = me->new_message(
                    id       = 'ZM1'
                    number   = 001
                    severity = ms-error
                    v1       = ls_busid-Busid
                  ).
  data ls_record like line of reported-travel.
  ls_record-%msg = message.
  APPEND ls_record to reported-travel.

  data ls_failed like line of failed-travel.
  APPEND ls_failed to failed-travel.
    endif.
      endloop.
*END OF BUSID CODE

*START OF CODE FOR PARTNERID
read entities of zdi_travel in LOCAL MODE ENTITY Travel fields ( Partnerid ) with CORRESPONDING #( keys )
RESULT data(partneridKey).

loop at partneridkey into data(ls_partnerkey).
select from zdi_partner fields PartnerID where PartnerID = @ls_partnerkey-Partnerid into table @data(it_partneridkey).
if it_partneridkey is initial.
data(message2) = me->new_message(
                   id       = 'ZM1'
                   number   = 002
                   severity = MS-error
                   v1       = ls_partnerkey-Partnerid
                 ).

data ls_record2 like line of reported-travel.
ls_record2-%msg = message2.
APPEND ls_record2 to reported-travel.

data ls_failed2 like line of failed-travel.
  APPEND ls_failed2 to failed-travel.
ENDIF.
endloop.
*END OF CODE FOR PARTNERID
 ENDMETHOD.


  METHOD updatefinalprice.

*START OF CODE FOR BUS
*READING ENTITIES
 read entities of zdi_travel in LOCAL MODE ENTITY Travel fields ( Busid )
 with CORRESPONDING #( keys )
 RESULT data(finalPrice).

 loop at finalprice into data(finalPriceafterGST).
*getting the actual bus price.
 select single from zdi_bus FIELDS BusPrice where BusID = @finalpriceaftergst-Busid into @data(it_price).
 if it_price is not initial.
 data fPrice type f.
 fPrice = ( ( 5 * it_price ) / 100 )  + it_price.
 modify ENTITIES OF zdi_travel IN LOCAL MODE
 ENTITY Travel update FIELDS ( FinalPrice ) with VALUE #( ( %tky = finalpriceaftergst-%tky FinalPrice = fPrice ) ).
 endif.

 endloop.

*END OF CODE FOR BUS

*START OF CODE FOR PARTNER
*READ ENTITIES OF ZDI_TRAVEL IN LOCAL MODE ENTITY Travel FIELDS ( Partnerid ) WITH CORRESPONDING #( KEYS )
*RESULT DATA(P_DETAILS).
*LOOP AT P_DETAILS INTO DATA(LT_PDETAILS).
*SELECT FROM zdi_partner FIELDS Name,PhoneNumber,Email,MfcNumber,DriverLicense,State,District,City,Area,Street,Pincode
*WHERE PartnerID = @lt_pdetails-Partnerid INTO TABLE @DATA(LT_PARTNER).
*IF lt_partner IS NOT INITIAL.
*MODIFY ENTITIES OF zdi_bus IN LOCAL MODE ENTITY UPDATE FIELDS (  )
*ENDIF.
*ENDLOOP.
*END OF CODE FOR PARTNER


  ENDMETHOD.

ENDCLASS.
