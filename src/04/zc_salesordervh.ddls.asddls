@AbapCatalog.sqlViewName: 'ZCSALESORDERVH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order'
@ObjectModel.dataCategory: #VALUE_HELP
define view ZC_SalesOrderVH
  as select from ZI_SalesOrder
{
  key SalesOrder,
      SalesOrderType
}

