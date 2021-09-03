@AbapCatalog.sqlViewName: 'ZVIEWPARAMSSRC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters Data Source'
define view Z_ViewWithParametersDataSource
  as select distinct from t000
{
  key 'A'        as KeyField,
  key 'E'        as Language,
  key cast( '99580809' as abap.dats ) as ValidityEndDate,
      cast( '20111004' as abap.dats ) as ValidityStartDate
      
}

