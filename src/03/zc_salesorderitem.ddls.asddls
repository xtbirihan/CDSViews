@AbapCatalog.sqlViewName: 'ZCSALESORDERITEM'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item'
@Metadata.allowExtensions: true
define view ZC_SalesOrderItem
  as select from ZI_SalesOrderItem
{
      @EndUserText.label: 'Sales Order'
  key SalesOrder,
  key SalesOrderItem,
      Product

}

