@AbapCatalog.sqlViewName: 'ZVIEWAANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View A with Annotations'

define view Z_ViewAWithAnnotations
  as select from zsalesorderitem
{
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  orderquantity       as OrderQuantity,
  @Semantics.unitOfMeasure: true
  orderquantityunit   as OrderQuantityUnit
}

