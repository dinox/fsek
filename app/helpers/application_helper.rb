module ApplicationHelper
  def markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end
   
  def fmt_time(time)
    time.strftime('%Y-%m-%d %H:%m')
  end
end
