@AbapCatalog.sqlViewName: 'ZVIEWNOASCPATHS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View without Association Paths'
define view Z_ViewWithoutAssociationPaths
  as select from           ZI_SalesOrderScheduleLine as SL
    left outer to one join ZI_SalesOrderItem         as ITEM
                        on ITEM.SalesOrder     = SL.SalesOrder
                       and ITEM.SalesOrderItem = SL.SalesOrderItem
    left outer to one join ZI_Product                as PROD 
                        on PROD.Product = ITEM.Product
{
  key SL.SalesOrder,
  key SL.SalesOrderItem,
  key SL.SalesOrderScheduleLine,
      _SalesOrderItem,
      ITEM.Product as SalesOrderItemProduct,
      ITEM._Product,
      PROD.Product,
      PROD._Text
}

