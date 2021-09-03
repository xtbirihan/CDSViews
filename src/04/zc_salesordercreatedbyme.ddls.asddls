@AbapCatalog.sqlViewName: 'ZCSALESORDERME'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Created by Me'
define view ZC_SalesOrderCreatedByMe
  as select from ZC_SalesOrder
{
  key SalesOrder,
      SalesOrderType
}
where
  CreatedByUser = $session.user

