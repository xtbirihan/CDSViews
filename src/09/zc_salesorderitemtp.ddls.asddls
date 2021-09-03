@AbapCatalog.sqlViewName: 'ZCSALESORDERITTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item'

//@ObjectModel.createEnabled:true

//@ObjectModel.updateEnabled:true

//@ObjectModel.deleteEnabled:true

@Metadata.allowExtensions: true
define view ZC_SalesOrderItemTP
  as select from ZI_SalesOrderItemTP
  association [1..1] to ZC_SalesOrderTP as _SalesOrder
   on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association [0..*] to ZC_SalesOrderScheduleLineTP as _SalesOrderScheduleLine
   on  $projection.SalesOrder     = _SalesOrderScheduleLine.SalesOrder
   and $projection.SalesOrderItem = _SalesOrderScheduleLine.SalesOrderItem

{

 key SalesOrder,
 key SalesOrderItem,
     Product,
     OrderQuantity,
     OrderQuantityUnit,
     NetAmount,
     TransactionCurrency,
     @ObjectModel.readOnly: true
     @ObjectModel.virtualElement: true
     @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_F_SALESORDERITEM'
     cast( ' ' as boole_d preserving type ) as OrderIsFreeOfCharge,
     CreatedByUser,
     CreationDateTime,
     LastChangedByUser,
     LastChangeDateTime,
     @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
     _SalesOrder,
     @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
     _SalesOrderScheduleLine,
     _Product

}

