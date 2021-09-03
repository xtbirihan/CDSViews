*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


CLASS lcl_productive_application IMPLEMENTATION.
  METHOD get_sales_order_relevance.
    SELECT SUM( cube~netamountindisplaycurrency )
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' ) AS cube
      INTO @DATA(lv_net_amount)
      WHERE cube~salesorder = @iv_sales_order_id.
    IF ( lv_net_amount GE 100 ).
      ev_relevance_rating = 1.
    ELSEIF ( lv_net_amount GE 30 ).
      ev_relevance_rating = 2.
    ELSE.
      ev_relevance_rating = 3.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

*####################################################################
CLASS lcl_zi_salesorderitemcube5 IMPLEMENTATION.
  METHOD test_abap_logic.

    set_test_data( ).

    lcl_productive_application=>get_sales_order_relevance(
      EXPORTING
        iv_sales_order_id = 'S1'
      IMPORTING
        ev_relevance_rating     = DATA(lv_relevance_rating) ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act              = lv_relevance_rating
        exp              = 2
        level            = if_aunit_constants=>critical
        quit             = if_aunit_constants=>method
      RECEIVING
        assertion_failed = DATA(lv_assertion_failed) ).

  ENDMETHOD.
*####################################################################

  METHOD set_test_data.

    DATA: lt_zi_salesorderitemcube
             TYPE STANDARD TABLE OF zi_salesorderitemcube
             WITH EMPTY KEY.
    lt_zi_salesorderitemcube = VALUE #(
       (
         salesorder                 = 'S1'
         salesorderitem             = '10'
         netamountindisplaycurrency = 10
          )
       (
         salesorder                 = 'S1'
         salesorderitem             = '20'
         netamountindisplaycurrency = 20
         )
    ).

    DATA: lt_parameter_value TYPE if_osql_param_values_config=>ty_parameter_value_pairs.
    lt_parameter_value = VALUE #(
      ( parameter_name  = 'P_DISPLAYCURRENCY'
        parameter_value = 'EUR' )
    ).
    go_osql_test_environment->insert_test_data(
      EXPORTING
        i_data             = lt_zi_salesorderitemcube
        i_parameter_values = lt_parameter_value ).

  ENDMETHOD.

*####################################################################

  METHOD class_setup.

    DATA: lt_stub TYPE if_osql_test_environment=>ty_t_sobjnames.
    lt_stub = VALUE #(
       ( 'ZI_SALESORDERITEMCUBE' )
    ).

    cl_osql_test_environment=>create(
      EXPORTING
        i_dependency_list = lt_stub
      RECEIVING
        r_result          = go_osql_test_environment ).

  ENDMETHOD.

*####################################################################

  METHOD setup.
    go_osql_test_environment->clear_doubles( ).
  ENDMETHOD.

*####################################################################

  METHOD class_teardown.
    go_osql_test_environment->destroy( ).
  ENDMETHOD.

ENDCLASS.

*####################################################################

CLASS lcl_zi_salesorderitemcube4 IMPLEMENTATION.

*####################################################################

  METHOD test_null_value.

    set_test_data( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count)
      WHERE zi_salesorderitemcube~producttype IS NOT NULL.

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act              = lv_count
        exp              = 1
        level            = if_aunit_constants=>critical
        quit             = if_aunit_constants=>method
      RECEIVING
        assertion_failed = DATA(lv_assertion_failed) ).

  ENDMETHOD.

*####################################################################

  METHOD set_test_data.

    DATA: lt_zsalesorderitem
             TYPE STANDARD TABLE OF zsalesorderitem
             WITH EMPTY KEY.
    lt_zsalesorderitem = VALUE #(
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '10'
         product        = 'P1' )
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '20'
         product        = 'P2' )
       ( client         =  sy-mandt
         salesorder     = 'S2'
         salesorderitem = '30'
         product        = 'P3' ) ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zsalesorderitem ).

    DATA: lt_zi_product
            TYPE STANDARD TABLE OF zi_product
            WITH EMPTY KEY.
    lt_zi_product = VALUE #(
      ( product     = 'P1' )
    ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zi_product ).

    DATA: lt_null_value_field_name TYPE if_cds_null_values_config=>ty_element_names.
    lt_null_value_field_name = VALUE #(
      ( CONV #( 'PRODUCTTYPE' ) )
    ).
    lt_zi_product = VALUE #(
      ( product = 'P2' )
    ).
    CALL METHOD go_cds_test_environment->insert_test_data
      EXPORTING
        i_data        = lt_zi_product
        i_null_values = lt_null_value_field_name.

  ENDMETHOD.

*####################################################################

  METHOD class_setup.
    DATA: lt_stub TYPE if_cds_test_environment=>ty_qlast_doubles.

    lt_stub = VALUE #(
       ( name = 'ZSALESORDERITEM' type ='TABLE' )
       ( name = 'ZSALESORDER'     type ='TABLE' )
       ( name = 'ZI_PRODUCT'      type ='CDS_VIEW' )
    ).

    cl_cds_test_environment=>create(
      EXPORTING
        i_for_entity      = 'ZI_SALESORDERITEMCUBE'
        i_dependency_list = lt_stub
      RECEIVING
        r_result          = go_cds_test_environment ).
  ENDMETHOD.

*####################################################################

  METHOD setup.
    go_cds_test_environment->clear_doubles( ).
  ENDMETHOD.

*####################################################################

  METHOD class_teardown.
    go_cds_test_environment->destroy( ).
  ENDMETHOD.

ENDCLASS.

*####################################################################

CLASS lcl_zi_salesorderitemcube3 IMPLEMENTATION.

*####################################################################

  METHOD test_currency_conversion.

    set_test_data( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count)
      WHERE netamountindisplaycurrency EQ 10.

    CALL METHOD cl_abap_unit_assert=>assert_equals
      EXPORTING
        act              = lv_count
        exp              = 1
        level            = if_aunit_constants=>critical
        quit             = if_aunit_constants=>method
      RECEIVING
        assertion_failed = DATA(lv_assertion_failed).

  ENDMETHOD.

*####################################################################

  METHOD set_test_data.

    DATA: lt_zi_salesorderitem
             TYPE STANDARD TABLE OF zi_salesorderitem
             WITH EMPTY KEY.
    lt_zi_salesorderitem = VALUE #(
       ( salesorder          = 'S1'
         salesorderitem      = '10'
         netamount           = 11
         transactioncurrency = 'USD'
         creationdate        = sy-datum )
       ( salesorder          = 'S1'
         salesorderitem      = '20'
         netamount           = 22
         transactioncurrency = 'USD'
         creationdate        = sy-datum )
       ( salesorder          = 'S2'
         salesorderitem      = '30'
         netamount           = 33
         transactioncurrency = 'USD'
         creationdate        = sy-datum ) ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zi_salesorderitem ).

    set_currency_conversion_data( ).

  ENDMETHOD.

*####################################################################

  METHOD set_currency_conversion_data.

    cl_cds_test_data=>create_currency_conv_data(
      EXPORTING
        output              = 10
      RECEIVING
        curr_conv_test_data = DATA(lo_curr_conv_data) ).

    lo_curr_conv_data->for_parameters(
      EXPORTING
        amount             = 11
        source_currency    = 'USD'
        target_currency    = 'EUR'
        exchange_rate_date = sy-datum
        exchange_rate_type = 'M'
        client             = sy-mandt
        round              = abap_true
        decimal_shift      = abap_true
        decimal_shift_back = abap_true
        error_handling     = 'FAIL_ON_ERROR'
      RECEIVING
        test_data          = DATA(lo_cds_test_data) ).

    go_cds_test_environment->get_double(
      EXPORTING
        i_name   = cl_cds_test_environment=>currency_conversion
      RECEIVING
        r_result = DATA(lo_cds_stub) ).

    lo_cds_stub->insert(
      EXPORTING
        i_test_data = lo_cds_test_data ).

  ENDMETHOD.

*####################################################################

  METHOD class_setup.
    cl_cds_test_environment=>create(
      EXPORTING
        i_for_entity      = 'ZI_SALESORDERITEMCUBE'
      RECEIVING
        r_result          = go_cds_test_environment ).
  ENDMETHOD.

*####################################################################

  METHOD setup.
    go_cds_test_environment->clear_doubles( ).
  ENDMETHOD.

*####################################################################

  METHOD class_teardown.
    go_cds_test_environment->destroy( ).
  ENDMETHOD.

ENDCLASS.


*####################################################################

CLASS lcl_zi_salesorderitemcube2 IMPLEMENTATION.

  METHOD set_test_data.

    DATA: lt_zsalesorder
             TYPE STANDARD TABLE OF zsalesorder
             WITH EMPTY KEY.
    lt_zsalesorder = VALUE #(
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesordertype = 'T1' )
       ( client         =  sy-mandt
         salesorder     = 'S2'
         salesordertype = 'T2' ) ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zsalesorder ).

    DATA: lt_zsalesorderitem
             TYPE STANDARD TABLE OF zsalesorderitem
             WITH EMPTY KEY.
    lt_zsalesorderitem = VALUE #(
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '10' )
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '20' )
       ( client         =  sy-mandt
         salesorder     = 'S2'
         salesorderitem = '30' ) ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zsalesorderitem ).

  ENDMETHOD.

*####################################################################

  METHOD class_setup.

    DATA: lt_stub TYPE if_cds_test_environment=>ty_qlast_doubles.
    lt_stub = VALUE #(
       ( name = 'ZSALESORDERITEM' type ='TABLE' )
       ( name = 'ZSALESORDER'     type ='TABLE' )
       ( name = 'ZI_PRODUCT'      type ='CDS_VIEW' )
    ).
    cl_cds_test_environment=>create(
      EXPORTING
        i_for_entity      = 'ZI_SALESORDERITEMCUBE'
        i_dependency_list = lt_stub
      RECEIVING
        r_result          = go_cds_test_environment ).

  ENDMETHOD.

*####################################################################

  METHOD setup.

    go_cds_test_environment->clear_doubles( ).

    go_cds_test_environment->get_access_control_double(
      RECEIVING
        rv_access_control_double = DATA(lo_ac_double) ).

    lo_ac_double->disable_access_control( ).

  ENDMETHOD.

*####################################################################

  METHOD class_teardown.
    go_cds_test_environment->destroy( ).
  ENDMETHOD.

*####################################################################

  METHOD test_full_authorization.

    set_test_data( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count_no_ac).

    set_full_authorization( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count_full_authorization).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_count_full_authorization
        exp                  = lv_count_no_ac
        level                = if_aunit_constants=>critical
        quit                 = if_aunit_constants=>method
      RECEIVING
        assertion_failed     = DATA(lv_assertion_failed) ).

  ENDMETHOD.

*####################################################################

  METHOD set_full_authorization.

    DATA: lt_role_authorization TYPE role_authorizations.

    lt_role_authorization = VALUE #(
       ( object         = 'V_VBAK_AAT'
         authorizations = VALUE #(
            ( VALUE #(
                 ( fieldname = 'AUART'
                   fieldvalues = VALUE #(
                      ( lower_value = '*' )
                  )
                 )
                 ( fieldname = 'ACTVT'
                   fieldvalues = VALUE #(
                      ( lower_value = '*' )
                  )
                 )
              )
            )
         )
       )
    ).

    cl_cds_test_data=>create_access_control_data(
      EXPORTING
        i_role_authorizations = lt_role_authorization
      RECEIVING
        r_instance            = DATA(lo_ac_data) ).

    go_cds_test_environment->get_access_control_double(
      RECEIVING
        rv_access_control_double = DATA(lo_ac_double) ).

    lo_ac_double->enable_access_control(
      EXPORTING
        i_access_control_data = lo_ac_data ).

  ENDMETHOD.

*####################################################################

  METHOD test_partial_authorization.

    set_partial_authorization( ).

    set_test_data( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count_partial_authorization).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_count_partial_authorization
        exp                  = 1
        level                = if_aunit_constants=>critical
        quit                 = if_aunit_constants=>method
      RECEIVING
        assertion_failed     = DATA(lv_assertion_failed) ).

    disable_access_control( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count_no_ac).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_count_no_ac
        exp                  = 3
        level                = if_aunit_constants=>critical
        quit                 = if_aunit_constants=>method
      RECEIVING
        assertion_failed     = lv_assertion_failed ).

  ENDMETHOD.

*####################################################################

  METHOD disable_access_control.

    go_cds_test_environment->get_access_control_double(
      RECEIVING
        rv_access_control_double = DATA(lo_ac_double) ).

    lo_ac_double->disable_access_control( ).

  ENDMETHOD.

*####################################################################

  METHOD set_partial_authorization.

    DATA: lt_role_authorization TYPE role_authorizations.

    lt_role_authorization = VALUE #(
       ( object         = 'V_VBAK_AAT'
         authorizations = VALUE #(
            ( VALUE #(
                 ( fieldname = 'AUART'
                   fieldvalues = VALUE #(
                      ( lower_value = 'T2' )
                  )
                 )
                 ( fieldname = 'ACTVT'
                   fieldvalues = VALUE #(
                      ( lower_value = '03' )
                  )
                 )
              )
            )
         )
       )
    ).

    cl_cds_test_data=>create_access_control_data(
      EXPORTING
        i_role_authorizations = lt_role_authorization
      RECEIVING
        r_instance            = DATA(lo_ac_data) ).

    go_cds_test_environment->get_access_control_double(
      RECEIVING
        rv_access_control_double = DATA(lo_ac_double) ).

    lo_ac_double->enable_access_control(
      EXPORTING
        i_access_control_data = lo_ac_data ).

  ENDMETHOD.

ENDCLASS.

*####################################################################

CLASS lcl_zi_salesorderitemcube IMPLEMENTATION.

  METHOD execute_test.

    DATA: lt_stub TYPE if_cds_test_environment=>ty_qlast_doubles.
    lt_stub = VALUE #(
       ( name = 'ZSALESORDERITEM' type ='TABLE' )
       ( name = 'ZSALESORDER'     type ='TABLE' )
       ( name = 'ZI_PRODUCT'      type ='CDS_VIEW' )
    ).
    cl_cds_test_environment=>create(
      EXPORTING
        i_for_entity      = 'ZI_SALESORDERITEMCUBE'
        i_dependency_list = lt_stub
      RECEIVING
        r_result          = DATA(lo_cds_test_environment) ).

    DATA: lt_zsalesorderitem
             TYPE STANDARD TABLE OF zsalesorderitem
             WITH EMPTY KEY.
    lt_zsalesorderitem = VALUE #(
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '10'
         product        = 'P1' )
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '20'
         product        = 'P2' )
       ( client         =  sy-mandt
         salesorder     = 'S2'
         salesorderitem = '30'
         product        = 'P3' ) ).
    lo_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zsalesorderitem ).

    DATA: lt_zi_product
            TYPE STANDARD TABLE OF zi_product
            WITH EMPTY KEY.
    lt_zi_product = VALUE #(
      ( product     = 'P1'
        producttype = 'T1' )
      ( product     = 'P2'
        producttype = 'T2' )
      ( product     = 'P3'
        producttype = 'T1' )
    ).
    lo_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zi_product ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count)
      WHERE zi_salesorderitemcube~producttype EQ 'T1'.

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act              = lv_count
        exp              = 2
        level            = if_aunit_constants=>critical
        quit             = if_aunit_constants=>method
      RECEIVING
        assertion_failed = DATA(lv_assertion_failed) ).

  ENDMETHOD.
ENDCLASS.

*####################################################################

CLASS lcl_zi_salesorderitemcube1 IMPLEMENTATION.

  METHOD set_test_data.

    DATA: lt_zsalesorderitem
             TYPE STANDARD TABLE OF zsalesorderitem
             WITH EMPTY KEY.
    DATA: lt_zi_product
            TYPE STANDARD TABLE OF zi_product
            WITH EMPTY KEY.

    lt_zsalesorderitem = VALUE #(
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '10'
         product        = 'P1' )
       ( client         =  sy-mandt
         salesorder     = 'S1'
         salesorderitem = '20'
         product        = 'P2' )
       ( client         =  sy-mandt
         salesorder     = 'S2'
         salesorderitem = '30'
         product        = 'P3' ) ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zsalesorderitem ).

    lt_zi_product = VALUE #(
      ( product     = 'P1'
        producttype = 'T1' )
      ( product     = 'P2'
        producttype = 'T2' )
      ( product     = 'P3'
        producttype = 'T1' )
    ).
    go_cds_test_environment->insert_test_data(
      EXPORTING
        i_data = lt_zi_product ).

  ENDMETHOD.

*####################################################################

  METHOD class_setup.

    DATA: lt_stub TYPE if_cds_test_environment=>ty_qlast_doubles.

    lt_stub = VALUE #(
       ( name = 'ZSALESORDERITEM' type ='TABLE' )
       ( name = 'ZSALESORDER'     type ='TABLE' )
       ( name = 'ZI_PRODUCT'      type ='CDS_VIEW' )
    ).

    cl_cds_test_environment=>create(
      EXPORTING
        i_for_entity      = 'ZI_SALESORDERITEMCUBE'
        i_dependency_list = lt_stub
      RECEIVING
        r_result          = go_cds_test_environment ).

  ENDMETHOD.

*####################################################################

  METHOD setup.
    go_cds_test_environment->clear_doubles( ).
  ENDMETHOD.

*####################################################################

  METHOD class_teardown.
    go_cds_test_environment->destroy( ).
  ENDMETHOD.

*####################################################################

  METHOD test_select.

    set_test_data( ).

    SELECT COUNT(*)
      FROM zi_salesorderitemcube( p_displaycurrency = 'EUR' )
      INTO @DATA(lv_count)
      WHERE zi_salesorderitemcube~producttype EQ 'T1'.

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act              = lv_count
        exp              = 2
        level            = if_aunit_constants=>critical
        quit             = if_aunit_constants=>method
      RECEIVING
        assertion_failed = DATA(lv_assertion_failed) ).

  ENDMETHOD.

ENDCLASS.
