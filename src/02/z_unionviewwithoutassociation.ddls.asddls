@AbapCatalog.sqlViewName: 'ZUNIONVIEWNOASC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union View without Association'
define view Z_UnionViewWithoutAssociation
  as select from Z_ViewAsDataSourceA
{
  key FieldA1 as UnionField1,
  key FieldA2 as UnionField2,
  key FieldA3 as UnionField3
}

union select from Z_ViewAsDataSourceB

{
  key FieldB1 as UnionField1,
  key FieldB2 as UnionField2,
  key ''      as UnionField3
}

