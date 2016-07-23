$(document).on 'page:load ready', ->
  calendar.init('#calendar')
   
calendar = {
  init: (selector) ->
    $(selector).fullCalendar {
      dayClick: (date, jsEvent, view)  ->
        if date <= new Date()
          $.ajax({
            url: '/menus/index',
            type: 'GET',
            data: {date: date.format()},
            dataType: 'script'
          });
    }
}  
