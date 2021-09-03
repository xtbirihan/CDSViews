@AbapCatalog.sqlViewName: 'ZVIEWPARAMSCONS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Parameters Consumer'
define view Z_ViewWithParametersConsumer
  as select from Z_ViewWithParameters( P_KeyDate: $session.system_date,
                                       P_Language: 'E')
{
  key KeyField
}

