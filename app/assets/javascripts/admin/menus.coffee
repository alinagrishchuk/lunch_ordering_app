$(document).on 'page:load ready', ->
  productSearch.init("#menu_name",'#menu_course_type')


productSearch = {
  init: (selector,dependent)->
    console.log("Search init!")

    $(selector).typeahead { highlight: true },
      {
        displayKey: 'label'
        source: (query, syncResults, asyncResults) ->
          $.get '/products?search=' + query, (data) ->
            asyncResults(data)
      }

    $(selector).bind 'typeahead:selected', (obj, datum, name)->
      $(dependent).val(datum.value)
      $(selector).blur()

    $(selector).bind 'typeahead:open',  ->
      $(selector).typeahead('val', '')

}


validPriceMessenger = {
  init: ->
    input = $('#menu_price');
    input.oninvalid = (event) ->
      event.target.setCustomValidity('Write correct price, please');
}