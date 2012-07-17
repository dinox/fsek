$ ->
  if window.controller == 'news' and window.action == 'index'
    page = 0
    $content = $('#content')
    $(window).scroll ->
      if $(window).scrollTop() == $(document).height() - $(window).height()
        page++
        $.ajax(url: "/news?bare=1&page=#{page}", success: (html) ->
          $content.append(html); return)
      return
  return

