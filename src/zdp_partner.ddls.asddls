@EndUserText.label: 'Partner Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZDP_PARTNER as projection on ZDI_PARTNER
{

@Search.defaultSearchElement: true
key PartnerID,
@Search.defaultSearchElement: true

BusID,

TravelID,

Name,

PhoneNumber,

Email,

MfcNumber,

DriverLicense,

State,

District,

City,

Area,

Street,

Pincode,

CreatedBy,

    CreatedAt,
   
    LastChangedBy,
   
    LastChangedAt,

    LocalLastChangedAt,
    /* Associations */
   _Travel : redirected to parent ZDP_TRAVEL
    
}
