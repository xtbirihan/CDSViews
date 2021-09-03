@AbapCatalog.sqlViewName: 'ZVIEWCASTS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Casts'
define view Z_ViewWithCasts
  as select distinct from t000

{
  t000.logsys                                                      as ProjectedField,
  '20170809'                                                       as CharacterField,
  cast ( '20170809' as abap.dats )                                 as DateField,
  cast ( cast ( 'E' as abap.lang ) as sylangu preserving type )    as LanguageField,
  1.2                                                              as FloatingPointField,
  FLTP_TO_DEC(1.2 as abap.dec(4,2) )                               as DecimalField

}

