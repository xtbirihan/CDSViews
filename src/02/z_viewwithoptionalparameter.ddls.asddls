@AbapCatalog.sqlViewName: 'ZVIEWPARAMOPTION'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Optional Parameter in Open SQL'
define view Z_ViewWithOptionalParameter
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_KeyDate : abap.dats
  as select distinct from Z_ViewWithParametersDataSource
{
  key KeyField
}
where
      ValidityEndDate   >= $parameters.P_KeyDate
  and ValidityStartDate <= $parameters.P_KeyDate
