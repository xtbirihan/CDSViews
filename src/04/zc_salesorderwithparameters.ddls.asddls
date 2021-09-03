@AbapCatalog.sqlViewName: 'ZCSOWITHPARAMS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order with Parameters'

define view ZC_SalesOrderWithParameters
  with parameters
    P_Parameter1A : abap.char(1),
    P_Parameter1B : abap.char(1),
    P_Parameter1C : abap.char(1)
  as select from ZI_SalesOrder
{
  key SalesOrder,
      SalesOrderType
}

