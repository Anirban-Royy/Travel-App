@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bus View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDI_BUS as select from zdbt1_bus as BUS
association to parent ZDI_TRAVEL as _Travel on $projection.TravelID = _Travel.TravelID
{
@EndUserText.label: 'BusID'
    key busid as BusID,
@EndUserText.label: 'TravelID'
    travelid as TravelID,
@EndUserText.label: 'BusPrice'
    bus_price as BusPrice,
    @EndUserText.label: 'BusSource'
    bus_source as BusSource,
    @EndUserText.label: 'BusDestination'
    bus_destination as BusDestination,
     @UI.hidden: true
     @Semantics.user.createdBy : true
    created_by as CreatedBy,
    @UI.hidden: true
    @Semantics.systemDateTime.createdAt : true
    created_at as CreatedAt,
    @UI.hidden: true
    @Semantics.user.lastChangedBy: true 
    last_changed_by as LastChangedBy,
    @UI.hidden: true
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    @UI.hidden: true
    @Semantics.systemDateTime.localInstanceLastChangedAt : true
    local_last_changed_at as LocalLastChangedAt,
    
    _Travel
    
}
