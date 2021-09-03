@AbapCatalog.sqlViewName: 'ZVIEWASCDFLTFILT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Association with Default Filter'

define view Z_ViewWithAssocWithDfltFilter
  as select from ZI_Product
  association [0..*] to ZI_ProductText as _TextWithDefaultFilter 
    on $projection.Product = _TextWithDefaultFilter.Product
    with default filter _TextWithDefaultFilter.Language = 'E'
  association [0..*] to ZI_ProductText as _Text
    on $projection.Product = _Text.Product
  association [0..1] to ZI_ProductText as _TextInEnglish
    on $projection.Product = _TextInEnglish.Product
    and _TextInEnglish.Language = 'E'

{
  Product,
  _TextWithDefaultFilter.ProductName as ProductNameInEnglish,
  _Text[1:Language='E'].ProductName  as ProductNameInEnglish2,
  _TextInEnglish.ProductName as ProductNameInEnglish3,
  _TextWithDefaultFilter[Language='D'].ProductName as ProductNameInGerman,
  _TextWithDefaultFilter[*:left outer].ProductName as ProductName,
  _TextWithDefaultFilter,
  _Text,
  _TextInEnglish

}



