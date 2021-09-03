@AbapCatalog.sqlViewName: 'ZVIEWUNITCONV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Unit Conversion'
define view Z_ViewWithUnitConversion
  with parameters
    P_DisplayUnit : msehi
  as select from ZI_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      @Semantics.unitOfMeasure: true
      OrderQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityDisplayUnit'
      unit_conversion( quantity => OrderQuantity,
                       source_unit => OrderQuantityUnit,
                       target_unit => :P_DisplayUnit,
                       error_handling => 'FAIL_ON_ERROR' ) as OrderQuantityInDisplayUnit,
      @Semantics.unitOfMeasure: true
      :P_DisplayUnit                                       as OrderQuantityDisplayUnit
}

