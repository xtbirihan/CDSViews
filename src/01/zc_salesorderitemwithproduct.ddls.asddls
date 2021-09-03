@AbapCatalog.sqlViewName: 'ZCSOITEMPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item with Product'
define view ZC_SalesOrderItemWithProduct
  as select from ZI_SalesOrderItem as ITEM
  left outer to one join ZI_Product as PROD
    on PROD.Product = ITEM.Product

{
    key ITEM.SalesOrder,
    key ITEM.SalesOrderItem,
        ITEM.Product,
        ITEM.OrderQuantity,
        ITEM.OrderQuantityUnit,
        PROD.ProductType,
        PROD.CreationDateTime
}

