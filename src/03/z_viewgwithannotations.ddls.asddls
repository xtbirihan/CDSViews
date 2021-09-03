@AbapCatalog.sqlViewName: 'ZVIEWGANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View G with Annotations'
define view Z_ViewGWithAnnotations
  as select from Z_ViewAWithAnnotations
{
  OrderQuantity     as Quantity,
  OrderQuantityUnit as QuantityUnit
}

