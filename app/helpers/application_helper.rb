# coding: utf-8
module ApplicationHelper
  def markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end

  def controls(obj, *args)
    options = {:p => false, :show => true}
    options.merge! args.extract_options!
    s = ''
    if options[:p] 
      s << "<p class=\"controls\">\n"
    end
    if options[:show] and can? :read, obj
      s << link_to('Visa', obj) << "\n"
    end
    if can? :update, obj
      s << ' | ' if options[:show] and can? :read, obj
      s << link_to('Ändra', 
                   "/#{obj.class.to_s.underscore.pluralize}/#{obj.id}/edit") 
      s << "\n"
      s << ' | ' if can? :destroy, obj
    end
    if can? :destroy, obj
      s << link_to('Förinta', obj, :confirm => 'Är du säker?', 
                   :method => :delete) << "\n"
      s << ' | ' if options[:back]
    end
    if options[:back]
      s << link_to('Tillbaka', options[:back]) << "\n"
    end
    if options[:p]
      s << "</p>\n"
    end
    raw s
  end
end
