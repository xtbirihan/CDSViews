@AbapCatalog.sqlViewName: 'ZISALESORDERTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order'
@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.compositionRoot:true
@ObjectModel.transactionalProcessingEnabled:true
@ObjectModel.writeActivePersistence: 'ZSALESORDER'
@ObjectModel.createEnabled:true
@ObjectModel.updateEnabled:true
@ObjectModel.deleteEnabled:false

define view ZI_SalesOrderTP
  as select from ZI_SalesOrder
  association [0..*] to ZI_SalesOrderItemTP as _SalesOrderItem
   on $projection.SalesOrder = _SalesOrderItem.SalesOrder
{
     @ObjectModel.readOnly: true
 key SalesOrder,
     @ObjectModel.mandatory: true
     SalesOrderType,
     @ObjectModel.mandatory: true
     SalesOrganization,
     @ObjectModel.mandatory: true
     DistributionChannel,
     @ObjectModel.mandatory: true
     OrganizationDivision,
     DeliveryStatus,
     @ObjectModel.readOnly: true
     cast ( case DeliveryStatus when 'C' then 'X' else ' ' end as compl_ind preserving type ) as DeliveryIsCompleted,
     @ObjectModel.readOnly: true
     DeletionIndicator,
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
     @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
     _SalesOrderItem,
     _SalesOrganization

}

