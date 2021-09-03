@AbapCatalog.sqlViewName: 'ZVIEWVALUEHELPS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Value Helps'
@Metadata.ignorePropagatedAnnotations: true
@OData.publish: true

define view Z_ViewWithValueHelps
  as select from ZI_SalesOrderItem
    association [0..1] to ZI_Product as _ProductA on $projection.ProductA = _ProductA.Product
    association [0..1] to ZI_Product as _ProductB on $projection.ProductB = _ProductB.Product

{
  key SalesOrder,
  key SalesOrderItem,
      _Product.ProductType,
      @ObjectModel.foreignKey.association: '_ProductA'
      Product as ProductA,
      @Consumption.valueHelpDefinition: [{association : '_ProductB'}]
      @ObjectModel.foreignKey.association: '_ProductB'
      Product as ProductB,
      @Consumption.valueHelpDefinition: [{ entity : {name    : 'ZI_Product',
                                                     element : 'Product'} }]
      Product as ProductC,
      @Consumption.valueHelpDefinition: [{ entity : {name    : 'ZI_Product',
                                                     element : 'Product'} ,
                                           additionalBinding : [
                                              { localElement :'ProductType',
                                                element      :'ProductType' } ]
                                        }]
      Product as ProductD,
      _ProductA,
      _ProductB

}

