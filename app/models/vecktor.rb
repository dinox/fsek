class Vecktor < ActiveRecord::Base
  attr_accessible :editor, :issue, :responsible_publisher, :year
  
  has_many :vecktor_notices

end

class VecktorNotice < ActiveRecord::Base
  attr_accessible :signature, :text, :title
end
