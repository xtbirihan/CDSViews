@AbapCatalog.sqlViewName: 'ZVIEWBANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View B with Annotations'
define view Z_ViewBWithAnnotations
  as select from Z_ViewAWithAnnotations
{
  cast( OrderQuantity as meng15 preserving type ) as OrderQuantity,
  @EndUserText.label:'Unit'
  OrderQuantityUnit
}
