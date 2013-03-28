$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "yy/mm/dd"
      changeMonth: true
      changeYear: true

  $("input.datetimepicker").each (i) ->
    $(this).datetimepicker
      altFormat: "yy-mm-dd"
      dateFormat: "yy/mm/dd"
      changeMonth: true
      changeYear: true
      inline: true
      showOn: 'button'

