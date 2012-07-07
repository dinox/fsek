# coding: utf-8
module ApplicationHelper
  def markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end

  def controls(obj, *args)
    options = {:show => true, :edit => true, :destroy => true}
    options.merge! args.extract_options!

    options[:show] = false if @current_action == 'show'
    options[:edit] = false if @current_action == 'edit'
    
    stuff_to_add = []
    if options[:show] and can? :read, obj
      stuff_to_add << link_to('Visa', obj)
    end
    if options[:edit] and can? :update, obj
      stuff_to_add << link_to('Ändra', 
                   "/#{obj.class.to_s.underscore.pluralize}/#{obj.id}/edit") 
    end
    if options[:destroy] and can? :destroy, obj
      stuff_to_add << link_to('Förinta', obj, :confirm => 'Är du säker?', 
                   :method => :delete)
    end
    if options[:back]
      stuff_to_add << link_to('Tillbaka', options[:back])
    end 

    output = ''
    output << "<div class=\"controls\">\n"
    stuff_to_add.each do |s|
      output << s << " | \n"
    end
    output = output[0...-4] + "\n"
    output << "</div>\n"

    return raw output
  end
end
