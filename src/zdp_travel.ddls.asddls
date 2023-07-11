@EndUserText.label: 'Travel Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZDP_TRAVEL
  provider contract transactional_query
  as projection on ZDI_TRAVEL as travel
{
  @Search.defaultSearchElement: true
  key TravelID   as TravelID ,
   
      //@Consumption.valueHelpDefinition: [{entity : {name : 'zdcd_partnerid', element : 'PartnerID'} }]
    Partnerid  as PartnerID,   
    Busid      as BusID,
      TravelDate as TravelDate,
      FinalPrice as FinalPrice,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _NBus : redirected to composition child zdpbus,
      _bus,
      _bus.BusDestination,
      _bus.BusSource,
      _bus.BusPrice,
      _PARTNER : redirected to composition child ZDP_PARTNER,
      _SPartner.Name,
       _SPartner.PhoneNumber,
       _SPartner.Email,
       _SPartner.MfcNumber,
       _SPartner.DriverLicense,
       _SPartner.State,
       _SPartner.District,
       _SPartner.City,
       _SPartner.Area,
       _SPartner.Street,
       _SPartner.Pincode
      
      
}
//projection name is not shown in the ui
