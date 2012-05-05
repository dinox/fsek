class VecktorNotice < ActiveRecord::Base
  attr_accessible :signature, :text, :title, :vecktor_id, :order_

  belongs_to :vecktor
  belongs_to :author, :class_name => :User

  # :author kan vara nil. Detta tolkas som att Sanningsministern kopierat 
  # notisen direkt ur ett mail.

  before_save :default_values 

  def default_values
    self.signature ||= self.author.to_s
  end
end
