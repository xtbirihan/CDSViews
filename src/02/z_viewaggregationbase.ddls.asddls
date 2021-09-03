@AbapCatalog.sqlViewName: 'ZVIEWAGGRBASE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Aggregation Base'
define view Z_ViewAggregationBase
  as select distinct from t000
{
  key 'A'                     as Field1,
  key 'A'                     as Field2,
      cast( 1 as abap.int1)   as Field3
}

union select distinct from t000
{
  key 'A'                       as Field1,
  key 'B'                       as Field2,
      cast( 2 as abap.int1)     as Field3

}

union select distinct from t000
{
  key 'A'                       as Field1,
  key 'C'                       as Field2,
      cast( 3 as abap.int1)     as Field3

}

