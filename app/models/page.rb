class Page < ActiveRecord::Base
  
  attr_accessible :title, :content, :original_author_id, :recent_author_id

  belongs_to :original_author, :class_name => :User
  belongs_to :recent_author,   :class_name => :User

  validates :title, :content, :original_author_id, :presence => true

#  validates_prescence_of :title, :original_author_id
end
