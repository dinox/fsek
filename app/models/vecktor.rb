require 'fsek_settings'

class Vecktor < ActiveRecord::Base
  include FsekSettings

  attr_accessible :editor, :issue, :responsible_publisher, :date
  
  has_many :vecktor_notices

  before_save :default_values # Kallback innan saker kommittas till databasen

  def default_values
    self.date      ||= Time.now.to_date # Vi bryr oss inte om tiden.
    self.editor    ||= Vecktor.setting :editor
    self.publisher ||= Vecktor.setting :publisher
  end
end

class VecktorNotice < ActiveRecord::Base
  attr_accessible :signature, :text, :title
end
