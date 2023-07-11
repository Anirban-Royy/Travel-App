CLASS zcl_partner DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_partner IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

   delete from zdbt1_partners.


data: it_partner type table of zdbt1_partners.
        it_partner = value #(
        (
        partnerid = 'PID01'
*        busid = 'BID01'
        travelid = 'TID01'
        name = 'Anirban Roy'
        phone_number = '8145441462'
        email = 'anirbanroy@outlook.com'
        mfc_number = 'MFC01'
        driver_license = 'OL85AGHHT596488'
        state = 'West Bengal'
        district = 'Paschim Burdwan'
        city = 'Durgapur'
        area = 'Benachity'
                street = '40 Rabindra Sarani'
        pincode = '713213')

         (
        partnerid = 'PID02'
        name = 'Rahul Roy'
*        busid = 'BID02'
        travelid = 'TID02'
        phone_number = '9851414625'
        email = 'rahulroy@outlook.com'
        mfc_number = 'MFC02'
        driver_license = 'UI56AGHHT596488'
        state = 'West Bengal'
        district = 'Kolkata'
       city = 'Kolkata'
        area = 'Park Street'
        street = '40 Rabindra Sarani'
        pincode = '713006')
        ).
        insert zdbt1_partners from table @it_partner.
        out->write( sy-dbcnt ).


  ENDMETHOD.
ENDCLASS.
