@AbapCatalog.sqlViewName: 'ZVIEWMN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View M:N Relation'

define view Z_ViewMToNRelation
  as select distinct from t000
  association [0..1] to Z_ViewAWithMToNRelationToViewB as _ViewA on $projection.KeyFieldA = _ViewA.KeyFieldA
  association [0..1] to Z_ViewBWithMToNRelationToViewA as _ViewB on $projection.KeyFieldB = _ViewB.KeyFieldB

{

  key 1 as KeyFieldA,
  key 3 as KeyFieldB,
      _ViewA,
      _ViewB

}

union select distinct from t000
association [0..1] to Z_ViewAWithMToNRelationToViewB as _ViewA on $projection.KeyFieldA = _ViewA.KeyFieldA
association [0..1] to Z_ViewBWithMToNRelationToViewA as _ViewB on $projection.KeyFieldB = _ViewB.KeyFieldB

{

  key 1 as KeyFieldA,
  key 4 as KeyFieldB,
      _ViewA,
      _ViewB

}

union select distinct from t000
association [0..1] to Z_ViewAWithMToNRelationToViewB as _ViewA on $projection.KeyFieldA = _ViewA.KeyFieldA
association [0..1] to Z_ViewBWithMToNRelationToViewA as _ViewB on $projection.KeyFieldB = _ViewB.KeyFieldB

{

  key 2 as KeyFieldA,
  key 4 as KeyFieldB,
      _ViewA,
      _ViewB
}

