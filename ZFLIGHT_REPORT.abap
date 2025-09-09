REPORT zflight_report.

"---------------------------------------------------
" Title  : Classical Report - Flight Information
" Author : Aayush Bairagi
" Date   : 2025-09-09
" Desc   : Displays flight details from table SFLIGHT
"---------------------------------------------------

" Work area and internal table
DATA: gs_flight TYPE sflight,
      gt_flights TYPE TABLE OF sflight.

"---------------------------------------------------
" Selection Screen
"---------------------------------------------------
PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY, " Airline ID
            p_connid TYPE sflight-connid OPTIONAL.   " Connection ID

"---------------------------------------------------
" Start-of-selection: fetch data
"---------------------------------------------------
START-OF-SELECTION.

  SELECT * FROM sflight
    INTO TABLE gt_flights
    WHERE carrid = p_carrid
      AND ( p_connid IS INITIAL OR connid = p_connid ).

  IF sy-subrc <> 0.
    WRITE: / 'No flight records found for given criteria.'.
    EXIT.
  ENDIF.

  PERFORM display_report.

"---------------------------------------------------
" Form Routine - Display Report
"---------------------------------------------------
FORM display_report.

  ULINE.
  WRITE: / 'Classical Report: Flight Information'.
  ULINE.
  WRITE: / 'CARRID', 10 'CONNID', 20 'FLDATE', 40 'PRICE', 55 'CURRENCY', 70 'SEATSMAX', 85 'SEATSOCC'.
  ULINE.

  LOOP AT gt_flights INTO gs_flight.
    WRITE: / gs_flight-carrid UNDER 'CARRID',
             gs_flight-connid UNDER 'CONNID',
             gs_flight-fldate UNDER 'FLDATE',
             gs_flight-price UNDER 'PRICE',
             gs_flight-currency UNDER 'CURRENCY',
             gs_flight-seatsmax UNDER 'SEATSMAX',
             gs_flight-seatsocc UNDER 'SEATSOCC'.
  ENDLOOP.

  ULINE.
  WRITE: / 'Total Records:', sy-dbcnt.
ENDFORM.
