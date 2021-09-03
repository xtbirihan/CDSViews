@AbapCatalog.sqlViewName: 'ZUNIONVIEWASC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union View with Association'
define view Z_UnionViewWithAssociation
  as select from Z_UnionViewWithoutAssociation
  association [0..1] to Z_ViewAsDataSourceC as _ViewC on $projection.UnionField1 = _ViewC.FieldC1
{
  key UnionField1,
  key UnionField2,
  key UnionField3,
      _ViewC

}

