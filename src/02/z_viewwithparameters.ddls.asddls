@AbapCatalog.sqlViewName: 'ZVIEWPARAMS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters'

define view Z_ViewWithParameters
  with parameters
    P_KeyDate  : abap.dats,
    P_Language : sylangu
  as select from Z_ViewWithParametersDataSource
  association [0..*] to Z_ViewWithParametersAscTrgt as _Target         
           on  $projection.KeyField = _Target.KeyField

  association [0..1] to Z_ViewWithParametersAscTrgt as _FilteredTarget 
           on $projection.KeyField = _FilteredTarget.KeyField
          and $projection.Language = _FilteredTarget.Language
{
  key KeyField,
      ValidityEndDate,
      ValidityStartDate,
      :P_Language                                                           as Language,
      _Target(P_ValidityDate: :P_KeyDate)[1:Language= :P_Language].KeyField as TargetKeyField,
      _FilteredTarget
}
where
      ValidityEndDate   >= :P_KeyDate
  and ValidityStartDate <= :P_KeyDate
  and Language          =  :P_Language

