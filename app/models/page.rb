class Page < ActiveRecord::Base
  
  attr_accessible :content, :original_author_id, :recent_author_id, :title

  belongs_to :original_author, :class_name => :User
  belongs_to :recent_author,   :class_name => :User

#  validates_prescence_of :title, :original_author_id
end
