class Alias < ActiveRecord::Base
  attr_accessible :page_id, :name

  belongs_to :page
end
