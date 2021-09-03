@AbapCatalog.sqlViewName: 'ZVIEWDATASRCC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View as Data Source C'
define view Z_ViewAsDataSourceC
  as select distinct from t000
{
  key cast( 'C' as abap.char(2) )  as FieldC1,
      cast( 'C2' as abap.char(2) ) as FieldC2
}

