@AbapCatalog.sqlViewName: 'ZVIEWBMNA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View B with M:N Relation to View A'

define view Z_ViewBWithMToNRelationToViewA
  as select distinct from t000
  association [0..*] to Z_ViewMToNRelation as _MToN on $projection.KeyFieldB = _MToN.KeyFieldB
{
  key 3 as KeyFieldB,
      _MToN
}

union select distinct from t000
association [0..*] to Z_ViewMToNRelation as _MToN on $projection.KeyFieldB = _MToN.KeyFieldB

{
  key 4 as KeyFieldB,
      _MToN
}

