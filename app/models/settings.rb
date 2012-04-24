class Settings < RailsSettings::CachedSettings
  attr_accessible :var, :value, :thing_id, :thing_type
end
