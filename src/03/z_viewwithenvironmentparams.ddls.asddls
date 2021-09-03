@AbapCatalog.sqlViewName: 'ZVIEWENVPARAMS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Environment Parameters'
define view Z_ViewWithEnvironmentParams
  with parameters
    @Environment.systemField: #SYSTEM_LANGUAGE
    P_Language : abap.lang
  as select from zproducttext
{
  key product      as Product,
      product_name as ProductName
}
where
  language = $parameters.P_Language

