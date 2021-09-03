@EndUserText.label: 'Country (via Table Function)'
@Analytics.dataCategory: #DIMENSION
@AbapCatalog.sqlViewName: 'Z_COUNTRYTF'
@ObjectModel.representativeKey: 'Country'
@ClientHandling.algorithm: #SESSION_VARIABLE

define view Z_CountryViaTableFunction
  as select from Z_TableFunctionCountry
                  ( P_SAPClient : $session.client )

  association [0..*] to I_CountryText as _Text
    on $projection.Country = _Text.Country
  association [0..1] to I_Currency    as _CountryCurrency
    on $projection.CountryCurrency = _CountryCurrency.Currency

{
  key Country,
      @ObjectModel.foreignKey.association: '_CountryCurrency'
      CountryCurrency,
      IndexBasedCurrency,
      HardCurrency,
      TaxCalculationProcedure,
      CountryThreeLetterISOCode,
      CountryThreeDigitISOCode,
      _Text,
      _CountryCurrency
}
