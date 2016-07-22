$(document).on 'page:load ready', ->
  $('#calendar').fullCalendar {
    dayClick:(date, jsEvent, view)  ->
      console.log date.format()
  }
