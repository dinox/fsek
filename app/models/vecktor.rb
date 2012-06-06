require 'fsek_settings'

class Vecktor < ActiveRecord::Base
  include FsekSettings

  attr_accessible :date, :editor_name, :publisher_name

  has_many :vecktor_notices
  belongs_to :editor,    :class_name => :User
  belongs_to :publisher, :class_name => :User

  alias :notices :vecktor_notices

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

  # Överskugga så att {publisher,editor}_name uppdateras automatiskt.

  alias :old_editor=    :editor=
  alias :old_publisher= :publisher=

  def editor= usr
    self.editor_name = usr.to_s_fstyle
    self.old_editor  = usr
  end

  def publisher= usr
    self.publisher_name = usr.to_s_fstyle
    self.old_publisher  = usr
  end


  def default_values
    self.date      ||= Time.now.to_date # Vi bryr oss inte om klockslaget.
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

  def to_ascii
    v_text = ''
    File.open 'app/assets/templates/vecktor' do |f|
      v_text << f.read % [self.issue, self.year,
                          self.editor    || self.editor_name, 
                          self.publisher || self.published_name]
    end
    v_text << "\n"
    vecktor_notices.each do |notice|
      v_text << notice.title.upcase + "\n\n"
      v_text << ActionController::Base.helpers.word_wrap(notice.text, 
                                                         :line_width => 80)
      v_text << "\n\n"
    end
    v_text
  end
      
    

  def to_s
    "Vecktorn, #{date}"
  end
end

