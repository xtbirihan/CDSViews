@AbapCatalog.sqlViewName: 'ZVIEWPERFASPB'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Performance Aspects B'

define view Z_ViewPerformanceAspectsB
  as select from           Z_ViewPerformanceAspectsA as BASE
    left outer to one join ZI_ProductText         as PT     on PT.Product  = BASE.Product
                                                           and PT.Language = 'E'
    left outer to one join ZI_ProductText         as CASTPT on PT.Product  = BASE.CastProduct
                                                           and PT.Language = 'E'
  association [0..*] to ZI_ProductText as _CastProductText on BASE.CastProduct = _CastProductText.Product

{
  key BASE.SalesOrder,
  key BASE.SalesOrderItem,
      BASE.ProductNameInEnglish2,
      PT.ProductName                                 as ProductNameInEnglish4,
      CASTPT.ProductName                             as ProductNameInEnglish5,
      BASE._ProductText[1:Language='E'].ProductName  as ProductNameInEnglish6,
      _CastProductText[1:Language='E'].ProductName   as ProductNameInEnglish7
}
where
     BASE.CastProduct = 'TEST_PRODUCT'
  or BASE.Product     = 'TEST_PRODUCT'

