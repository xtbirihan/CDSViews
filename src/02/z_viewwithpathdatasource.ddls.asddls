@AbapCatalog.sqlViewName: 'ZVIEWPATHDATASRC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Path Expression as Data Source'
define view Z_ViewWithPathDataSource
  as select from ZI_SalesOrderItem._SalesOrder
{
  key SalesOrder,
      _Item as _SalesOrderItem

}
