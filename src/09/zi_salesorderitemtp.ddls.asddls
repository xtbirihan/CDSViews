@AbapCatalog.sqlViewName: 'ZISALESORDERITTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item'
@ObjectModel.writeActivePersistence: 'ZSALESORDERITEM'
@ObjectModel.createEnabled:true
@ObjectModel.updateEnabled:true
@ObjectModel.deleteEnabled:true
define view ZI_SalesOrderItemTP
  as select from ZI_SalesOrderItem
  association [1..1] to ZI_SalesOrderTP as _SalesOrder
   on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association [0..*] to ZI_SalesOrderScheduleLineTP as _SalesOrderScheduleLine
   on  $projection.SalesOrder     = _SalesOrderScheduleLine.SalesOrder
   and $projection.SalesOrderItem = _SalesOrderScheduleLine.SalesOrderItem

{

     @ObjectModel.readOnly: true
 key SalesOrder,
     @ObjectModel.mandatory: true
     @ObjectModel.readOnly: 'EXTERNAL_CALCULATION'
 key SalesOrderItem,
     @ObjectModel.mandatory: true
     Product,
     @ObjectModel.mandatory: true
     OrderQuantity,
     @ObjectModel.mandatory: true
     OrderQuantityUnit,
     NetAmount,
     TransactionCurrency,
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
     @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
     _SalesOrder,
     @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
     _SalesOrderScheduleLine,
     _Product

}

