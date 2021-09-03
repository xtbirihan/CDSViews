@AbapCatalog.sqlViewName: 'ZVIEWDATASRCE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View as Data Source E'

define view Z_ViewAsDataSourceE
  as select distinct from t000
{
  key cast( 'D' as abap.char(1) ) as FieldE1,
  key cast( 'H' as abap.char(1) ) as FieldE2
}

union select distinct from t000
{
  key cast( 'D' as abap.char(1) ) as FieldE1,
  key cast( 'I' as abap.char(1) ) as FieldE2
}

union select distinct from t000
{
  key cast( 'F' as abap.char(1) ) as FieldE1,
  key cast( 'I' as abap.char(1) ) as FieldE2

}

