# encoding: utf-8

class Page < ActiveRecord::Base
  attr_accessible :title, :content, :original_author_id, :recent_author_id

  belongs_to :original_author, :class_name => :User
  belongs_to :recent_author,   :class_name => :User

  validates :title, :presence => true
end
