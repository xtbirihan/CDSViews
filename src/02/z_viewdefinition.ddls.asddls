/*comment*/
//other comment
//annotation definitions
@AbapCatalog.sqlViewName: 'ZVIEWDEF'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Definition'
//view definition
define view Z_ViewDefinition
  //parameter definition
  with parameters
    P_SalesOrderType : auart
  //data source of selection with alias name
  as select distinct from  ZI_SalesOrderItem as ITEM
  //join
    left outer to one join ZI_SalesOrder     as SO on SO.SalesOrder = ITEM.SalesOrder
  //association definition
  association [0..1] to ZI_Product as _Product on $projection.RenamedProduct = _Product.Product
{
      //projected field as key
  key ITEM.SalesOrder,
      //projected field used in association definition
  key ITEM.Product                   as RenamedProduct,
      //calculated field
      cast( 'A' as abap.char(2) )    as CalculatedField,
      //aggregate
      count(*)                       as NumberOfAggregatedItems,
      //projected association
      ITEM._SalesOrder,
      //association exposure
      _Product
}
//filter conditions based on joined field and parameter
where
  SO.SalesOrderType = $parameters.P_SalesOrderType
//aggregation level
group by
  ITEM.SalesOrder,
  ITEM.Product
