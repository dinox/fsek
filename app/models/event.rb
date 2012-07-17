class Event < ActiveRecord::Base
  attr_accessible :title, :text, :begins_at, :ends_at, :user_id, :page_id

  belongs_to :news
  belongs_to :user
 
=begin
  # Code for linking content to corresponding News. Untested.

  # This model is kludgy because we want the content to be linked to the corresponding
  # News, if there is one. Otherwise, Event needs to keep its own data.

  before save do
    unless page.nil?
      unless self[:title].nil?
        page.title = self[:title]
        self[:title] = nil
      end unless self[:text].nil?
        page.text = self[:text]
        self[:text] = nil
      end
    end
  end

  after_save do 
    page.save unless page.nil?
  end

  def title
    if self[:page_id].nil?
      self[:title]
    else
      page.title
    end
  end

  def title= new_title
    if self[:page_id].nil?
      self[:title] = new_title
    else
      page.title = new_title
    end
  end

  def text
    if self[:page_id].nil?
      self[:text]
    else
      page.text
    end
  end

  def text= new_text
    if self[:page_id].nil?
      self[:text] = new_text
    else
      page.text = new_text
    end
  end
=end

end
