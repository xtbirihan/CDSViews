@AbapCatalog.sqlViewName: 'ZVIEWCALCFLDASCS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Calculated Field in Associations'
define view Z_ViewWithCalcFieldsInAssocs
  as select from ZI_SalesOrderItem
  association [0..1] to ZI_Product as _Product                   on ZI_SalesOrderItem.Product = _Product.Product
  association [0..1] to ZI_Product as _ProductWithAlias          on $projection.ProductWithAlias = _ProductWithAlias.Product
  association [0..1] to ZI_Product as _ProductWithCast           on $projection.ProductWithCast = _ProductWithCast.Product
  association [0..1] to ZI_Product as _ProductWithCastPreserving on $projection.ProductWithCastPreserving = _ProductWithCastPreserving.Product

{
  key SalesOrder,
  key SalesOrderItem,
      Product,
      _Product,
      _Product.ProductType,
      Product                                 as ProductWithAlias,
      _ProductWithAlias,
      _ProductWithAlias.ProductType           as ProductTypeWithAlias,
      cast (Product as matnr)                 as ProductWithCast,
      _ProductWithCast,
      cast (Product as matnr preserving type) as ProductWithCastPreserving,
      _ProductWithCastPreserving,
      _ProductWithCastPreserving.ProductType  as ProductTypeWithCastPreserving

}

