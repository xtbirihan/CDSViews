@AbapCatalog.sqlViewName: 'ZVIEWODATA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with OData Auto-Exposure'
@ObjectModel.usageType:{ serviceQuality : #B,
                         sizeCategory   : #L,
                         dataClass      : #TRANSACTIONAL }
@OData.publish: true
define view Z_ViewWithODataExposure
  as select from zsalesorder
{
  key salesorder as SalesOrder
}

