class Role < ActiveRecord::Base
  attr_accessible :description, :tag, :title
  has_and_belongs_to_many :users
end
