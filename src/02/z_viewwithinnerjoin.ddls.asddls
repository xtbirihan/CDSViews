@AbapCatalog.sqlViewName: 'ZVIEWINNERJOIN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Inner-Join'
define view Z_ViewWithInnerJoin
  as select from Z_ViewAsDataSourceD
    inner join   Z_ViewAsDataSourceE on Z_ViewAsDataSourceD.FieldD2 = Z_ViewAsDataSourceE.FieldE1

{
  key Z_ViewAsDataSourceD.FieldD1,
  key Z_ViewAsDataSourceD.FieldD2,
  key Z_ViewAsDataSourceE.FieldE2
}

