$ ->
  # Mark drop-down menus (degrade gracefully).
  $('.top-sub').parent().children('a').children('div').append(' &or;')
  
  # Make menu drop-down.
  $('nav#top-menu div').hover( \
    ->
      $(this).find('.top-sub').show().children().css('display', 'block')
      return
      
  , ->
      $(this).find('.top-sub').hide()
      return
  )
  return
    
