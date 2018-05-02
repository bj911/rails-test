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
      $('#users').html($(data).find('#users').html())
      $('th').removeClass('asc desc')
      self.addClass(order)
  });
