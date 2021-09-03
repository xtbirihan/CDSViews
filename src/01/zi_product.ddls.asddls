@AbapCatalog.sqlViewName: 'ZIPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@ClientHandling.algorithm: #SESSION_VARIABLE
@EndUserText.label: 'Product'
@ObjectModel.representativeKey: 'Product'
@ObjectModel.usageType:{ serviceQuality : #A,
                         sizeCategory   : #L,
                         dataClass      : #MASTER }
@Search.searchable: true 
define view ZI_Product
  as select from zproduct
  association [0..*] to ZI_ProductText as _Text on $projection.Product = _Text.Product

{
      @ObjectModel.text.association: '_Text'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
  key product            as Product,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      product_type       as ProductType,
      creation_date_time as CreationDateTime,
      _Text

}

