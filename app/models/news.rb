class News < ActiveRecord::Base
  attr_accessible :text, :title, :user_id

  belongs_to :user
  has_one :event

  validates :text, :title, :user_id, :presence => true
end
