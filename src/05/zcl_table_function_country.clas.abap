CLASS zcl_table_function_country DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb .
    CLASS-METHODS get_countries
        FOR TABLE FUNCTION z_tablefunctioncountry .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_table_function_country IMPLEMENTATION.
  METHOD get_countries
        BY DATABASE FUNCTION FOR HDB
           LANGUAGE SQLSCRIPT
           OPTIONS READ-ONLY
           USING I_Country.

    RETURN
      SELECT
        :p_sapclient AS mandt,
        country,
        countrycurrency,
        indexbasedcurrency,
        hardcurrency,
        taxcalculationprocedure,
        countrythreeletterisocode,
        countrythreedigitisocode
      FROM
        I_Country
      WHERE
        mandt = :p_sapclient;

  ENDMETHOD.

ENDCLASS.
