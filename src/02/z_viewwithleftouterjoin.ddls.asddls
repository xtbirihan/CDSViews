@AbapCatalog.sqlViewName: 'ZVIEWLOJOIN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Left-Outer-Join'
define view Z_ViewWithLeftOuterJoin
  as select from            Z_ViewAsDataSourceD
    left outer to many join Z_ViewAsDataSourceE on Z_ViewAsDataSourceD.FieldD2 = Z_ViewAsDataSourceE.FieldE1
{
  key Z_ViewAsDataSourceD.FieldD1,
  key Z_ViewAsDataSourceD.FieldD2,
  key Z_ViewAsDataSourceE.FieldE2
}

