*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################

CLASS lcl_productive_application DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS: get_sales_order_relevance
      IMPORTING
        iv_sales_order_id   TYPE vbeln
      EXPORTING
        ev_relevance_rating TYPE int4.
ENDCLASS.

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################
CLASS lcl_zi_salesorderitemcube5
  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA: go_osql_test_environment TYPE REF TO if_osql_test_environment.
    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    METHODS: set_test_data.
    METHODS: test_abap_logic FOR TESTING.

ENDCLASS.

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################

*!@testing ZI_SALESORDERITEMCUBE
CLASS lcl_zi_salesorderitemcube4
  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA: go_cds_test_environment TYPE REF TO if_cds_test_environment.
    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    CLASS-METHODS: set_test_data.
    METHODS: test_null_value FOR TESTING.
ENDCLASS.

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################

*!@testing ZI_SALESORDERITEMCUBE
CLASS lcl_zi_salesorderitemcube3
  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA: go_cds_test_environment TYPE REF TO if_cds_test_environment.
    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    CLASS-METHODS: set_test_data.
    CLASS-METHODS: set_currency_conversion_data.
    METHODS: test_currency_conversion FOR TESTING.
ENDCLASS.

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################

*!@testing ZI_SALESORDERITEMCUBE
CLASS lcl_zi_salesorderitemcube2
  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA: go_cds_test_environment TYPE REF TO if_cds_test_environment.
    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    CLASS-METHODS: set_test_data.
    CLASS-METHODS: disable_access_control.
    CLASS-METHODS: set_full_authorization.
    METHODS: test_full_authorization FOR TESTING.
    CLASS-METHODS: set_partial_authorization.
    METHODS: test_partial_authorization FOR TESTING.
ENDCLASS.

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################

"!@testing ZI_SALESORDERITEMCUBE
CLASS lcl_zi_salesorderitemcube
  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    METHODS: execute_test FOR TESTING.

ENDCLASS.

*####################################################################
*####################################################################
*####################################################################
*####################################################################
*####################################################################

*!@testing ZI_SALESORDERITEMCUBE
CLASS lcl_zi_salesorderitemcube1
  DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA: go_cds_test_environment TYPE REF TO if_cds_test_environment.
    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    METHODS: set_test_data.
    METHODS: test_select FOR TESTING.

ENDCLASS.
