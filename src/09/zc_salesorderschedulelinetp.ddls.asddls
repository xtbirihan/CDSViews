@AbapCatalog.sqlViewName: 'ZCSALESORDERSLTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Schedule Line'
@ObjectModel.createEnabled:true
@ObjectModel.updateEnabled:true
@ObjectModel.deleteEnabled:true

define view ZC_SalesOrderScheduleLineTP
  as select from ZI_SalesOrderScheduleLineTP
  association [1..1] to ZC_SalesOrderTP as _SalesOrder
   on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association [1..1] to ZC_SalesOrderItemTP as _SalesOrderItem
   on  $projection.SalesOrder     = _SalesOrderItem.SalesOrder
   and $projection.SalesOrderItem = _SalesOrderItem.SalesOrderItem

{

 key SalesOrder,
 key SalesOrderItem,
 key SalesOrderScheduleLine,
     DeliveryDate,
     OrderQuantity,
     OrderQuantityUnit,
     CreatedByUser,
     CreationDateTime,
     LastChangedByUser,
     LastChangeDateTime,
     @ObjectModel.association.type: [#TO_COMPOSITION_ROOT]
     _SalesOrder,
     @ObjectModel.association.type: [#TO_COMPOSITION_PARENT]
     _SalesOrderItem
}

