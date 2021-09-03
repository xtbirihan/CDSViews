@AbapCatalog.sqlViewName: 'ZVIEWAMNB'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View A with M:N Relation to View B'
define view Z_ViewAWithMToNRelationToViewB
  as select distinct from t000
  association [0..*] to Z_ViewMToNRelation as _MToN on $projection.KeyFieldA = _MToN.KeyFieldA

{
  key 1 as KeyFieldA,
      _MToN

}

union select distinct from t000
association [0..*] to Z_ViewMToNRelation as _MToN on $projection.KeyFieldA = _MToN.KeyFieldA

{
  key 2 as KeyFieldA,
      _MToN

}

