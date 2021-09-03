@AbapCatalog.sqlViewName: 'ZVIEWFANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View F with Annotations'

define view Z_ViewFWithAnnotations
  as select from Z_ViewAWithAnnotations
{
  OrderQuantity,
  OrderQuantityUnit,
  @Semantics.unitOfMeasure: true
  cast( 'PC' as abap.unit(3) ) as PieceUnit
}

