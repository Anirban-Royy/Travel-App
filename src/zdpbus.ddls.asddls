@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BusProjection'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZDPBUS as projection on ZDI_BUS
{
@Search.defaultSearchElement: true
    key BusID,
    TravelID,
    BusPrice,
    BusSource,
    BusDestination,
   CreatedBy,

    CreatedAt,
   
    LastChangedBy,
   
    LastChangedAt,

    LocalLastChangedAt,
    _Travel : redirected to parent ZDP_TRAVEL
}
