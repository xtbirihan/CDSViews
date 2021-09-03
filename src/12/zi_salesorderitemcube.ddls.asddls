@AbapCatalog.sqlViewName: 'ZISLSORDITMCUBE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Sales Order Item Cube'
define view ZI_SalesOrderItemCube
  with parameters
    @Consumption.defaultValue: 'EUR'
    P_DisplayCurrency : vdm_v_display_currency
  as select from           ZI_SalesOrderItem as ITEM
    left outer to one join ZI_SalesOrder     as SO   on SO.SalesOrder = ITEM.SalesOrder
    left outer to one join ZI_Product        as PROD on PROD.Product = ITEM.Product
{
  key ITEM.SalesOrder,
  key ITEM.SalesOrderItem,
      ITEM.Product,
      SO.SalesOrderType,
      PROD.ProductType,
      ITEM.NetAmount,
      ITEM.TransactionCurrency,
      @Semantics.currencyCode: true
      $parameters.P_DisplayCurrency as  DisplayCurrency,
      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      currency_conversion(
        amount             => ITEM.NetAmount,
        source_currency    => ITEM.TransactionCurrency,
        target_currency    => $parameters.P_DisplayCurrency,
        exchange_rate_date => ITEM.CreationDate,
        exchange_rate_type => 'M',
        error_handling     => 'FAIL_ON_ERROR',
        round              => 'X',
        decimal_shift      => 'X',
        decimal_shift_back => 'X'

      )                           as  NetAmountInDisplayCurrency

}

