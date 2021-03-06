@AbapCatalog.sqlViewName: 'ZVIEWDATASRCD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View as Data Source D'

define view Z_ViewAsDataSourceD
  as select distinct from t000
{
  key cast( 'A' as abap.char(1) ) as FieldD1,
      cast( 'D' as abap.char(1) ) as FieldD2
}

union select distinct from t000
{
  key cast( 'C' as abap.char(1) ) as FieldD1,
      cast( 'E' as abap.char(1) ) as FieldD2
}

