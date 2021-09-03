@AbapCatalog.sqlViewName: 'ZCSALESORDER'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order'

define view ZC_SalesOrder
  as select from ZI_SalesOrderItem._SalesOrder
{
  key SalesOrder,
      SalesOrderType,
      CreatedByUser,
      _Item as _SalesOrderItem

}



