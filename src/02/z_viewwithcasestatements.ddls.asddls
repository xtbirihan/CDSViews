@AbapCatalog.sqlViewName: 'ZVIEWCASES'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View with Case Statements'
define view Z_ViewWithCaseStatements
  as select from ZI_SalesOrder
{
  key SalesOrder,
      case (SalesOrderType)
        when 'TAF' then 'X'
        when 'OAF' then 'X'
        else ''
      end as IsStandardOrder,

      cast( case (SalesOrderType)
        when 'TAF' then 'X'
        when 'OAF' then 'X'
        else ''
      end as abap.char(3) ) as IsStandardOrderAsChar3,

      case when SalesOrderType = 'TAF' then 'X'
           when SalesOrderType = 'OAF' then 'X'
        else ''
      end as IsStandardOrder2

}

