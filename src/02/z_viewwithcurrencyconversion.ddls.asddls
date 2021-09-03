@AbapCatalog.sqlViewName: 'ZVIEWCURRCONV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Currency Conversion'
define view Z_ViewWithCurrencyConversion
  with parameters
    P_DisplayCurrency  : waers_curc,
    P_ExchangeRateDate : sydatum
  as select from ZI_SalesOrderItem
{
  key SalesOrder,
  key SalesOrderItem,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      @Semantics.currencyCode: true
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'DisplayCurrency'
      currency_conversion( amount             => NetAmount,
                           source_currency    => TransactionCurrency,
                           target_currency    => :P_DisplayCurrency,
                           exchange_rate_date => :P_ExchangeRateDate,
                           exchange_rate_type => 'M',
                           round              => 'X',
                           decimal_shift      => 'X',
                           decimal_shift_back => #CDSBoolean.true,
                           error_handling => 'SET_TO_NULL' ) as NetAmountInDisplayCurrency,
      @Semantics.currencyCode: true
      :P_DisplayCurrency                                     as DisplayCurrency
}

