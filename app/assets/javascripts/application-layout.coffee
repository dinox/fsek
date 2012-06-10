$ ->
    # Mark drop-down menus (degrade gracefully).
    $('ul.top-sub').parent().children('a').append(' &or;')
    
    # Make menu drop-down.
    $('ul.top-super li').hover( ->
        $(this).find('ul.top-sub').show().children().css('display', 'block')
        
    , ->
        $(this).find('ul.top-sub').hide()
    )

        
    
