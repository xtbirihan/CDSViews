@AbapCatalog.sqlViewName: 'ZVIEWEANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View E with Annotations'
define view Z_ViewEWithAnnotations
  as select from Z_ViewAWithAnnotations
{
  OrderQuantity,
  @Semantics.unitOfMeasure: true
  cast( 'PC' as abap.unit(3) ) as OrderQuantityUnit
}

