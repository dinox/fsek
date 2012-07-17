# coding: utf-8
module ApplicationHelper
  def markdown(text)
    text.blank? ? "" : Maruku.new(text).to_html
  end

  def put_errors obj
    if defined? obj.errors and obj.errors.any?
      s = ''
      s << "<div id=error_explanation>\n"
      s << "<h2>#{obj.errors.count} fel hindrade resursen från att sparas.</h2>\n"
      s << "<ul>\n"
      obj.errors.full_messages.each do |msg|
        s << "<li>#{msg}</li>\n"
      end
      s << "</ul>\n</div>"
    end
  end

  def controls(obj, *args)
    options = {:show => true, :edit => true, :destroy => true}

    if @action == 'show'
      options[:show] = false 
    elsif @action == 'edit'
      options[:edit] = false 
    elsif @action == 'new'
      options[:show] = false
      options[:edit] = false
      options[:destroy] = false
    end

    options.merge! args.extract_options!
    
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

    if not stuff_to_add.empty?
      output = ''
      output << "<div class=\"controls\">\n"
      stuff_to_add.each do |s|
        output << s << " | "
      end
      output = output[0...-3] + "\n"
      output << "</div>\n"
      return raw output
    else
      return ''
    end
  end
end
