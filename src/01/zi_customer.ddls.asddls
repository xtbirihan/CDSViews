@AbapCatalog.sqlViewName: 'ZICUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Customer'

define view ZI_Customer as select from zcustomer
{
  key customer as Customer
}
