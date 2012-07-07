$ ->
  $('a#more-name-fields').click ->
    new_input = $('div.name input').first().clone()
    $('div.name').last().append('<br>').append(new_input.attr('value', ''))
    return
  return


