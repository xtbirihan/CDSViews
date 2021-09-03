@AbapCatalog.sqlViewName: 'ZCSALESORDERTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order'
@ObjectModel.compositionRoot:true
@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.createEnabled:true
@ObjectModel.updateEnabled:true
@ObjectModel.deleteEnabled:false
@Metadata.allowExtensions: true
@OData.publish: true

define view ZC_SalesOrderTP
  as select from ZI_SalesOrderTP
  association [1..*] to ZC_SalesOrderItemTP as _SalesOrderItem on $projection.SalesOrder = _SalesOrderItem.SalesOrder
{

  key SalesOrder,
      SalesOrderType,
      SalesOrganization,
      DistributionChannel,
      OrganizationDivision,
      DeliveryStatus,
      DeletionIndicator,
      CreatedByUser,
      CreationDateTime,
      LastChangedByUser,
      LastChangeDateTime,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _SalesOrderItem,
      _SalesOrganization
}

