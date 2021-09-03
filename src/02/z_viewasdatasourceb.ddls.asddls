@AbapCatalog.sqlViewName: 'ZVIEWDATASRCB'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View as Data Source B'
define view Z_ViewAsDataSourceB
  as select distinct from t000
{
  key cast( 'B_X' as abap.char(3) )      as FieldB1,
      cast( 'A' as abap.char(1) )        as FieldB2
}

