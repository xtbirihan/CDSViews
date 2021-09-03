@AbapCatalog.sqlViewName: 'ZISALESORDERSL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Schedule Line'

define view ZI_SalesOrderScheduleLine
  as select from zsalesordersline
  association [1..1] to ZI_SalesOrder     as _SalesOrder     
           on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association [1..1] to ZI_SalesOrderItem as _SalesOrderItem 
           on  $projection.SalesOrder     = _SalesOrderItem.SalesOrder
           and $projection.SalesOrderItem = _SalesOrderItem.SalesOrderItem

{
  key salesorder             as SalesOrder,
  key salesorderitem         as SalesOrderItem,
  key salesorderscheduleline as SalesOrderScheduleLine,
      deliverydate           as DeliveryDate,
      orderquantity          as OrderQuantity,
      orderquantityunit      as OrderQuantityUnit,
      createdbyuser          as CreatedByUser,
      creationdatetime       as CreationDateTime,
      lastchangedbyuser      as LastChangedByUser,
      lastchangedatetime     as LastChangeDateTime,
      _SalesOrder,
      _SalesOrderItem
}

