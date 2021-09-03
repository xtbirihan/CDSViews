@AbapCatalog.sqlViewName: 'ZUNIONVIEWDUP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union View with Duplicate'
define view Z_UnionViewWithDuplicate
  as select from Z_ViewAsDataSourceA
{
  FieldA1
}
union all select from Z_ViewAsDataSourceA
{
  FieldA1
}

