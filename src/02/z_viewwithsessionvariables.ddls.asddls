@AbapCatalog.sqlViewName: 'ZVIEWSESSIONVARS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Session Variables'
define view Z_ViewWithSessionVariables
  as select from t000
{
  $session.client          as ClientField,
  $session.system_date     as SystemDateField,
  $session.system_language as SystemLanguageField,
  $session.user            as UserField
}
where mandt = $session.client
