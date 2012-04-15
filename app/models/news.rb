class News < ActiveRecord::Base
  attr_accessible :text, :title

	has_one :user
end
