$(document).on 'click', 'th', ->
  self = $(this)
  order = if $(this).attr('class') == 'asc' then 'desc' else 'asc'
  field = $(this).text()
  $.ajax({
    url: '/users',
    method: 'GET',
    dataType: "html",
    data: {field: field, order: order}
    success: (data) ->
      $('.message').hide()
      $('#users').html($(data).find('#users').html())
      $('th').removeClass('asc desc')
      self.addClass(order)
  });

$(document).on 'click', '.search', ->
  search = $('#search').val()
  $.ajax({
    url: '/users',
    method: 'GET',
    dataType: "html",
    data: {search: search}
    success: (data) ->
      if $(data).find('#users').length
        $('#users').html($(data).find('#users').html())
        $('.message').hide()
      else
        $('.message').show()
      $('th').removeClass('asc desc')
  });