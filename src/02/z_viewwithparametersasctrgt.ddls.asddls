@AbapCatalog.sqlViewName: 'ZVIEWPARAMSTRGT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters Association Target'
define view Z_ViewWithParametersAscTrgt
  with parameters
    P_ValidityDate : abap.dats
  as select from Z_ViewWithParametersDataSource
{
  key KeyField,
  key Language,
      ValidityEndDate,
      ValidityStartDate
}
where
      ValidityEndDate   >= $parameters.P_ValidityDate
  and ValidityStartDate <= $parameters.P_ValidityDate

