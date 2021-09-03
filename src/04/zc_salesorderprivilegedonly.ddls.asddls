@AbapCatalog.sqlViewName: 'ZCSOPRIVONLY'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Privileged Only'

define view ZC_SalesOrderPrivilegedOnly
  as select from ZI_SalesOrder
{
  key SalesOrder,
      SalesOrderType,
      CreatedByUser
}

