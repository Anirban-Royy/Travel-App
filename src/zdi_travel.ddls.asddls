@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel View'
define root view entity ZDI_TRAVEL 
as select from zdbt1_travel as travel
association [1..1] to ZDI_BUS as _bus on $projection.Busid = _bus.BusID
composition [1..*] of ZDI_PARTNER as _PARTNER
composition [1..*] of ZDI_BUS as _NBus
association [1..1] to ZDI_PARTNER as _SPartner on $projection.Partnerid = _SPartner.PartnerID


{
@EndUserText.label: 'TravelID'
    key travelid as TravelID,
    @EndUserText.label: 'PartnerID'
     partnerid as Partnerid,
    @EndUserText.label: 'BusID'
     busid as Busid,
    @EndUserText.label: 'TravelDate'
    travel_date as TravelDate,
    @EndUserText.label: 'FinalPrice'
    final_price as FinalPrice,
    @UI.hidden: true
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @UI.hidden: true
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @UI.hidden: true
    @Semantics.user.lastChangedBy: true 
    last_changed_by as LastChangedBy,
    @UI.hidden: true
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    @UI.hidden: true
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt, 
    _PARTNER,
    _SPartner,
    _bus,
    _NBus
    
}
