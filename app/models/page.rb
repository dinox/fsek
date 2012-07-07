# encoding: utf-8

class Page < ActiveRecord::Base
  attr_accessible :title, :content, :original_author_id, :recent_author_id, :names

  belongs_to :original_author, :class_name => :User
  belongs_to :recent_author,   :class_name => :User
  has_many   :aliases

  validates :title, :presence => true

  after_save :save_names

  def self.by_name name
    a = Alias.find :first, :conditions => { :name => name }
    a ? a.page : nil
  end

  def names
    Alias.where(:page_id => id).collect { |a| a.name }
  end

  def names= names
    @names = names
  end

  def save_names
    if defined? @names
      Alias.where(:page_id => id).each do |a|
        a.destroy
      end
      @names.each do |name|
        next if name.empty?
        Alias.create(:page_id => id, :name => name).save
      end
    end
  end
end
