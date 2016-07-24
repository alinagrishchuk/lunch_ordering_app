$(document).on 'page:update', ->
  calendar.init('#calendar' )
  console.log "calendar fire!"
   
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
