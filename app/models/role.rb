class Role < ActiveRecord::Base
  attr_accessible :description, :tag, :title, :singular
  has_and_belongs_to_many :users

  before_save :default_values # Hade varit snyggare med before_validates, 
                              # men vi behöver self.tag.

  # Singulära roller kan bara innehas av en person åt gången.
  validates :users, :length => {:minimum => 0, :maximum => 1}, 
                    :if => :singular? 
  validates :tag,   :presence => true, 
                    :uniqueness => true

  def default_values
    self.title ||= self.tag.capitalize
    # singular ||= false, men det är redan speccat i databasen.
  end
end
