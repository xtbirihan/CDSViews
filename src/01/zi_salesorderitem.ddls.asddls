@AbapCatalog.sqlViewName: 'ZISALESORDERITEM'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item'

define view ZI_SalesOrderItem
  as select from zsalesorderitem
  association [1..1] to ZI_SalesOrder as _SalesOrder 
           on $projection.SalesOrder = _SalesOrder.SalesOrder
  association [0..1] to ZI_Product    as _Product   
           on $projection.Product = _Product.Product

{
      @ObjectModel.foreignKey.association: '_SalesOrder'
  key salesorder          as SalesOrder,
  key salesorderitem      as SalesOrderItem,
      @Consumption.valueHelp:'_Product'
      @ObjectModel.foreignKey.association: '_Product'
      product             as Product,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      orderquantity       as OrderQuantity,
      orderquantityunit   as OrderQuantityUnit @<Semantics.unitOfMeasure:true,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      netamount           as NetAmount,
      @Semantics.currencyCode: true
      transactioncurrency as TransactionCurrency,
      @Semantics.systemDate.createdAt: true
      creationdate        as CreationDate,
      createdbyuser       as CreatedByUser,
      creationdatetime    as CreationDateTime,
      lastchangedbyuser   as LastChangedByUser,
      lastchangedatetime  as LastChangeDateTime,
      _SalesOrder,
      _Product

}

