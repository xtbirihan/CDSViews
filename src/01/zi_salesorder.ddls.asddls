@AbapCatalog.sqlViewName: 'ZISALESORDER'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order'
define view ZI_SalesOrder
  as select from zsalesorder
  association [0..1] to ZI_SalesOrganization as _SalesOrganization 
           on $projection.SalesOrganization = _SalesOrganization.SalesOrganization
  association [0..*] to ZI_SalesOrderItem    as _Item              
           on $projection.SalesOrder = _Item.SalesOrder
  association [0..1] to ZI_Customer as _SoldToParty                
           on  $projection.SoldToParty = _SoldToParty.Customer
{

  key salesorder           as SalesOrder,
      salesordertype       as SalesOrderType,
      @ObjectModel.foreignKey.association: '_SalesOrganization'
      salesorganization    as SalesOrganization,
      @ObjectModel.foreignKey.association: '_SoldToParty'
      soldtoparty          as SoldToParty,
      distributionchannel  as DistributionChannel,
      organizationdivision as OrganizationDivision,
      deliverystatus       as DeliveryStatus,
      deletionindicator    as DeletionIndicator,
      createdbyuser        as CreatedByUser,
      creationdatetime     as CreationDateTime,
      lastchangedbyuser    as LastChangedByUser,
      lastchangedatetime   as LastChangeDateTime,
      _Item,
      _SalesOrganization,
      _SoldToParty

}

