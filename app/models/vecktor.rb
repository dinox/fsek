require 'fsek_settings'

class Vecktor < ActiveRecord::Base
  include FsekSettings

  attr_accessible :issue, :year, :date

  has_many :vecktor_notices
  belongs_to :editor, :class_name => :user
  belongs_to :publisher, :class_name => :user

  alias :notices :vecktor_notices

  before_save :default_values # Kallback innan saker kommittas till databasen

  def default_values
    self.date      ||= Time.now.to_date # Vi bryr oss inte om klockslaget.
    self.editor    ||= Vecktor.setting :editor
    self.publisher ||= Vecktor.setting :publisher
    self.year      ||= self.date.year() - Vecktor.setting(:first_year)
    last_issue = Vecktor.find :first, :order => 'date desc, issue desc'
    if last_issue.nil? or last_issue.year != self.year
      this_issue = 1
    else
      this_issue = last_issue.issue + 1
    end
    self.issue ||= this_issue
  end
end

class VecktorNotice < ActiveRecord::Base
  attr_accessible :signature, :text, :title

  has_one :user, :as => :author
end
