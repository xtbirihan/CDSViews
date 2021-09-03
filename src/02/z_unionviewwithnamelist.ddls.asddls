@AbapCatalog.sqlViewName: 'ZUNIONVIEWNAME'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union View with Name List'

define view Z_UnionViewWithNameList(
    UnionField1,
    UnionField2,
    UnionField3,
    _ViewC
  )

  as select from Z_ViewAsDataSourceA
  association [0..1] to Z_ViewAsDataSourceC as _A_ViewC on $projection.FieldA1 = _A_ViewC.FieldC1
{
  key FieldA1,
  key FieldA2,
  key FieldA3,
      _A_ViewC

}

union select from Z_ViewAsDataSourceB
association [0..1] to Z_ViewAsDataSourceC as _B_ViewC on $projection.FieldB2 = _B_ViewC.FieldC1

{

  key FieldB2,
  key FieldB1,
  key '',
      _B_ViewC

}

