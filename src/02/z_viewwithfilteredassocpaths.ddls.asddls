@AbapCatalog.sqlViewName: 'ZVIEWFILTASCS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Filtered Association Paths'
define view Z_ViewWithFilteredAssocPaths
  as select from ZI_Product
{
  Product,
  _Text[1:Language='E'].ProductName as ProductNameInEnglish,
  _Text[1:Language='E'].Product     as ProductOfEnglishText
}
