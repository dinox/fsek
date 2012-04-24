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
                                                # that mixes me in?
      begin         
        var.each do |key, value| # fail here if var is not hash-like.
          if value.nil?
            Settings.destroy "#{class_name}.#{key}"
          else
            Settings["#{class_name}.#{key}"] = value
          end
        end
      rescue NoMethodError # var is probably just a setting key.
        Settings["#{class_name}.#{var}"]
      end
    end

    def all_settings
      class_name = self.new.class.to_s.downcase
      settings = Settings.all("#{class_name}.")
      new_settings = Hash.new
      settings.each do |key, value|
        new_settings[key[/\.(.*)/, 1].to_sym] = value
      end
      new_settings
    end
  end
end

