class Post < ActiveRecord::Base
  attr_accessible :description, :title, :access_id

  has_many :access
end
