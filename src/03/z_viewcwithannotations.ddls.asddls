@AbapCatalog.sqlViewName: 'ZVIEWCANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View C with Annotations'
define view Z_ViewCWithAnnotations
  as select from Z_ViewBWithAnnotations
{
  @Semantics.unitOfMeasure: null
  OrderQuantityUnit

}

