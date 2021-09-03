@AbapCatalog.sqlViewName: 'ZISALESORDERSLTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Schedule Line'
@ObjectModel.writeActivePersistence: 'ZSALESORDERSLINE'
@ObjectModel.createEnabled:true
@ObjectModel.updateEnabled:true
@ObjectModel.deleteEnabled:true

define view ZI_SalesOrderScheduleLineTP
  as select from ZI_SalesOrderScheduleLine
  association [1..1] to ZI_SalesOrderTP as _SalesOrder
   on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association [1..1] to ZI_SalesOrderItemTP as _SalesOrderItem
   on  $projection.SalesOrder     = _SalesOrderItem.SalesOrder
   and $projection.SalesOrderItem = _SalesOrderItem.SalesOrderItem
{
     @ObjectModel.readOnly: true
 key SalesOrder,
     @ObjectModel.readOnly: true
 key SalesOrderItem,
     @ObjectModel.mandatory: true
 key SalesOrderScheduleLine,
     @ObjectModel.mandatory: true
     DeliveryDate,
     @ObjectModel.mandatory: true
     OrderQuantity,
     @ObjectModel.mandatory: true
     OrderQuantityUnit,
     @ObjectModel.readOnly: true
     @Semantics.user.createdBy: true
     CreatedByUser,
     @ObjectModel.readOnly: true
     @Semantics.systemDateTime.createdAt: true
     CreationDateTime,
     @ObjectModel.readOnly: true
     @Semantics.user.lastChangedBy: true
     LastChangedByUser,
     @ObjectModel.readOnly: true
     @Semantics.systemDateTime.lastChangedAt: true
     LastChangeDateTime,
     @ObjectModel.association.type: [#TO_COMPOSITION_ROOT]
     _SalesOrder,
     @ObjectModel.association.type: [#TO_COMPOSITION_PARENT]
     _SalesOrderItem
}

