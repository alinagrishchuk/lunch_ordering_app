$(document).on 'page:load ready', ->
  calendar = new Calendar()

class Calendar
  constructor: ->
    @bind_all()

  init: (selector, url) ->
    $(selector).fullCalendar {
      dayClick: (date, jsEvent, view)  ->
        if date <= new Date()
          $.ajax({
            url: url,
            type: 'GET',
            data: {date: date.format()},
            dataType: 'script'
          });
    }

  bind_all: ->
    if Calendar.check_exist('.menus-calendar #calendar')
      @init('#calendar','/menus')
      console.log "menus-calendar bind!"
    if Calendar.check_exist('.orders-calendar #calendar')
      @init('#calendar','/admin/orders')
      console.log "orders-calendar bind!"

  @check_exist: (selector)->
    $(selector).length



