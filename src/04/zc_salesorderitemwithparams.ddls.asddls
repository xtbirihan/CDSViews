@AbapCatalog.sqlViewName: 'ZSOIWITHPARAMS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item with Parameters'

define view ZC_SalesOrderItemWithParams
  with parameters
    P_Parameter2A : abap.char(1),
    P_Parameter2B : abap.char(1)
  as select from ZI_SalesOrderItem
  association [0..1] to ZC_SalesOrderWithParameters as _SalesOrder on $projection.SalesOrder = _SalesOrder.SalesOrder
{
  key SalesOrder,
  key SalesOrderItem,
      _SalesOrder

}

