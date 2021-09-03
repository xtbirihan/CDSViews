@AbapCatalog.sqlViewName: 'ZISALESORG'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Organization'
define view ZI_SalesOrganization
  as select from zsalesorg
{
  key salesorganization as SalesOrganization
}

