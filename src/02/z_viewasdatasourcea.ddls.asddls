@AbapCatalog.sqlViewName: 'ZVIEWDATASRCA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View as Data Source A'
define view Z_ViewAsDataSourceA
  as select distinct from t000
  association [0..1] to Z_ViewAsDataSourceC as _ViewC on $projection.FieldA3 = _ViewC.FieldC1
{
  key cast( 'A' as abap.char(1) ) as FieldA1,
      cast( 'B' as abap.char(1) ) as FieldA2,
      cast( 'C' as abap.char(2) ) as FieldA3,
      _ViewC
}

