@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDI_PARTNER as select from zdbt1_partners as PARTNER

//association to parent ZDI_TRAVEL as _Travel on $projection.TravelID = _Travel.Travelid
                                         //   and $projection.BusID = _Travel.Busid 
                                        //    and $projection.PartnerID = _Travel.Partnerid
 association to parent ZDI_TRAVEL as _Travel on $projection.TravelID = _Travel.TravelID
                                             //and $projection.BusID = _Travel.Busid
                                             //and $projection.PartnerID = _Travel.Partnerid
                                            
                                             
                                                                                                    
{
@EndUserText.label: 'PartnerID'
    key partnerid as PartnerID,
   // @UI.hidden: true
  @EndUserText.label: 'BusID'
     busid as BusID,
 //  @UI.hidden: true
   @EndUserText.label: 'TravelID'
    travelid as TravelID,
    @EndUserText.label: 'Name'
    name as Name,
    @EndUserText.label: 'Phone Number'
    phone_number as PhoneNumber,
    @EndUserText.label: 'Email'
    email as Email,
//    @UI.hidden: true
    mfc_number as MfcNumber,
//    @UI.hidden: true
    driver_license as DriverLicense,
 //   @UI.hidden: true
    state as State,
//    @UI.hidden: true
    district as District,
//    @UI.hidden: true
    city as City,
  //  @UI.hidden: true
    area as Area,
 //   @UI.hidden: true
    street as Street,
//   @UI.hidden: true
    pincode as Pincode,
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
