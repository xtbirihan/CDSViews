@AbapCatalog.sqlViewName: 'ZIPRODUCTTEXT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Product Text'
@ObjectModel.representativeKey: 'Product'
@ObjectModel.dataCategory: #TEXT
define view ZI_ProductText as select from zproducttext
{
      @Semantics.language: true
  key language           as Language,
  key product            as Product,
      @Semantics.text: true
      product_name       as ProductName
}

