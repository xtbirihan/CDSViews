@AbapCatalog.sqlViewName: 'ZVIEWLOJOINALIAS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Join and Alias'
define view Z_ViewWithJoinAndAlias
  as select from           Z_ViewAsDataSourceD as D1
    left outer to one join Z_ViewAsDataSourceD as D2 on D1.FieldD1 = D2.FieldD1
{
  key D1.FieldD1,
      D2.FieldD2
}

