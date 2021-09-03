@AbapCatalog.sqlViewName: 'ZCSOWITHUSRINPUT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order with User Input'

define view ZC_SalesOrderWithUserInput
  with parameters P_UserInput : abap.char(4)

  as select from ZI_SalesOrder
{
  key SalesOrder,
      $parameters.P_UserInput as UserInput

}

