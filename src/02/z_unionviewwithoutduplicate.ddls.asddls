@AbapCatalog.sqlViewName: 'ZUNIONVIEWNODUP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union View without Duplicate'

define view Z_UnionViewWithoutDuplicate
  as select from Z_ViewAsDataSourceA
{
  key FieldA1
}

union select from Z_ViewAsDataSourceA
{
  key FieldA1
}

