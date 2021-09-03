@EndUserText.label: 'Text for Processing Priority'
@ObjectModel.dataCategory: #TEXT
@AbapCatalog.sqlViewName: 'ZPRIORITYT'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.representativeKey: 'ZZPriority'
@ClientHandling.algorithm: #SESSION_VARIABLE

define view Z_PriorityText as select from dd07t
  association [0..1] to Z_Priority as _ZZPriority on $projection.ZZPriority = _ZZPriority.ZZPriority
  association [0..1] to I_Language as _Language on $projection.Language = _Language.Language
{
  @Semantics.language
  key cast( ddlanguage as spras preserving type ) as Language,
  @ObjectModel.foreignKey.association: '_ZZPrioritaet'
  key cast ( substring(domvalue_l, 1, 1) as zzprio preserving type ) as ZZPriority,
  @Semantics.text
  cast ( substring(ddtext, 1, 20) as zzpriotext preserving type ) as ZZPriorityText,
  _ZZPriority, 
  _Language
}
where domname = 'ZZPRIO' and as4local = 'A'
