@EndUserText.label: 'Processing Priority'
@Analytics.dataCategory: #DIMENSION
@AbapCatalog.sqlViewName: 'ZPRIORITY'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.representativeKey: 'ZZPriority'
@ClientHandling.algorithm: #SESSION_VARIABLE

define view Z_Priority as select from dd07l
  association [0..*] to Z_PriorityText as _Text on $projection.ZZPriority = _Text.ZZPriority
{
  @ObjectModel.text.association: '_Text'
  key cast ( substring(domvalue_l, 1, 1) as zzprio preserving type ) as ZZPriority,
  _Text
}
where domname = 'ZZPRIO' and as4local = 'A'
