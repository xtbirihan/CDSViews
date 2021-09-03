@AbapCatalog.sqlViewName: 'ZVIEWAGGRS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Aggregations'

define view Z_ViewWithAggregations
  as select from Z_ViewAggregationBase
{
  key Field1,
      min(Field3)                      as FieldWithMin,
      max(Field3)                      as FieldWithMax,
      avg(Field3)                      as FieldWithAvg,
      cast( sum(Field3) as abap.int4 ) as FieldWithSum,
      sum(Field3)                      as FieldWithSum2,
      count( distinct Field1 )         as FieldWithCountDistinct,
      count(*)                         as FieldWithCountAll

}
group by
  Field1

