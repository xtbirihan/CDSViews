@AbapCatalog.sqlViewName: 'ZVIEWCARDPATHS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Cardinality Changing Association Paths'
define view Z_ViewWithCardChngngAssocPaths
  as select from ZI_Product

{
  key Product,
  key _Text[*:inner].Language
}
