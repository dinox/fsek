class Alias < ActiveRecord::Base
  attr_accessible :page_id, :url

  belongs_to :page
end
