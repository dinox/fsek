# Skriven av Johan Förberg 2012
#
# Mixin för att kunna komma åt settingar med klassmetoder.
#

require 'rails-settings-cached'

module FsekSettings
  # Kludge som måste göras för att få med klassmetoder när vi mixar in.
  def self.included receiver
    receiver.extend ClassMethods
  end

  module ClassMethods
    # Heller inte speciellt vackert.
    def setting(var)
      # var is either 
      # * a hash with key => value pairs to set
      # * a symbol to get the corresponding value for
      # Setting a setting to nil destroys it.
      
      

      class_name = self.new.class.to_s.downcase # What is the name of the class
      if var.respond_to? :each_key              # That mixes me in?
        var.each do |key, value|
          if value.nil?
            Setting.destroy "#{class_name}.#{key}"
          else
            Setting["#{class_name}.#{key}"] = value
          end
        end 
      else
        Setting["#{class_name}.#{var}"]
      end
    end

    def all_settings
      class_name = self.new.class.to_s.downcase
      settings = Setting.all("#{class_name}.")
      new_settings = Hash.new
      settings.each do |key, value|
        new_settings[key[/\.(.*)/, 1].to_sym] = value
      end
      new_settings
    end
  end
end

