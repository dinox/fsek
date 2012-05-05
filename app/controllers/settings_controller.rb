class SettingsController < ApplicationController
  load_and_authorize_resource

  respond_to :html, :xml, :json

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
    respond_with @settings
  end
end
