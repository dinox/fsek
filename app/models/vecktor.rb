require 'fsek_settings'

class Vecktor < ActiveRecord::Base
  include FsekSettings

  attr_accessible :date
#  attr_reader :year, :issue

  has_many :vecktor_notices
  belongs_to :editor,    :class_name => :User
  belongs_to :publisher, :class_name => :User

  alias :notices    :vecktor_notices
  #alias :published? :published

  before_save :default_values # Kallback innan saker kommittas till databasen
  
  def published
    !! self[:published] # Typkast till booleskt värde.
  end

  # Gör attributet privat, typ.
  private 
  def published= val
    self[:published] = val
  end 
  public

  def publish
    self.published = true
  end

  def default_values
    self.date      ||= Time.now.to_date # Vi bryr oss inte om klockslaget.
    self.editor    ||= User.find(Vecktor.setting :editor)
    self.publisher ||= User.find(Vecktor.setting :publisher)
    self.year      ||= self.date.year() - Vecktor.setting(:first_year)
    if self.issue.nil?
      last_issue = Vecktor.first :order => 'date desc, issue desc'
      if last_issue.nil? or last_issue.year != self.year
        self.issue = 1
      else
        self.issue = last_issue.issue + 1
      end
   end
  end

  def to_s
    "Vecktorn, #{date}"
  end

  def plain_text
    # Magi här
  end
end

class VecktorNotice < ActiveRecord::Base
  attr_accessible :signature, :text, :title, :vecktor_id, :order_

  belongs_to :author, :class_name => :User

  # :author kan vara nil. Detta tolkas som att Sanningsministern kopierat 
  # notisen direkt ur ett mail.

  before_save :default_values 

  def default_values
    self.signature ||= self.author.to_s
  end
end
