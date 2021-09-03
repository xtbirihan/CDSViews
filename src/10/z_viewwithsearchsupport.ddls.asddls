@AbapCatalog.sqlViewName: 'ZVIEWSEARCH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Search Support'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true
@Search.searchable: true
define view Z_ViewWithSearchSupport as select from ZI_SalesOrderItem {
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.4
    @Search.ranking: #MEDIUM
    key SalesOrder,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #HIGH
key cast( SalesOrderItem as abap.char(10)) as SalesOrderItem,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #HIGH
    @Consumption.hidden:true
    SalesOrderItem as SalesOrderItemForSearch,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 1.0
    @Search.ranking: #MEDIUM
    Product,
    _Product.ProductType,
    OrderQuantity,
    OrderQuantityUnit

}

