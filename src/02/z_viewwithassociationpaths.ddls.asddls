@AbapCatalog.sqlViewName: 'ZVIEWASCPATHS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Association Paths'

define view Z_ViewWithAssociationPaths
  as select from ZI_SalesOrderScheduleLine
{
  key SalesOrder,
  key SalesOrderItem,
  key SalesOrderScheduleLine,
      _SalesOrderItem,
      _SalesOrderItem.Product as SalesOrderItemProduct,
      _SalesOrderItem._Product,
      _SalesOrderItem._Product.Product,
      _SalesOrderItem._Product._Text
}

