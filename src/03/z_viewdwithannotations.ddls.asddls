@AbapCatalog.sqlViewName: 'ZVIEWDANNOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View D with Annotations'
@Metadata.ignorePropagatedAnnotations:true

define view Z_ViewDWithAnnotations
  as select from Z_ViewCWithAnnotations
{
  OrderQuantityUnit
}
