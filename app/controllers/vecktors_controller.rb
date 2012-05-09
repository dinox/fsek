class VecktorsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_and_authorize_resource

  respond_to :html, :xml, :json

  # GET /vecktors
  # GET /vecktors.json
  def index
    @vecktors = Vecktor.find :all, :order => 'date desc', 
                             :conditions => { :published => true }
    @year_vecktors = @vecktors.group_by { |v| v.date.year }
    @sanning  = Role.where(:tag => :sanning).first.users.first
    @deadline = Vecktor.setting :deadline

    respond_with @vecktors 
  end

  # GET /vecktors/1
  # GET /vecktors/1.json
  def show
    # Om vi inte får nåt id-nummer, visa senaste vecktorn. (se rutten 'vecktorn')
    if params[:id]
      @vecktor = Vecktor.find(params[:id])
    else
      @vecktor = Vecktor.first :order => 'date desc'
    end

    respond_with @vecktor
  end

  # GET /vecktors/new
  # GET /vecktors/new.json
  def new
    @vecktor = Vecktor.new

    respond_with @vecktor
  end

  # GET /vecktors/1/edit
  def edit
    @vecktor = Vecktor.find(params[:id])
  end

  # POST /vecktors
  # POST /vecktors.json
  def create
    @vecktor = Vecktor.new(params[:vecktor])

    respond_to do |format|
      if @vecktor.save
        format.html { redirect_to @vecktor, notice: 'Vecktor was successfully created.' }
        format.json { render json: @vecktor, status: :created, location: @vecktor }
      else
        format.html { render action: "new" }
        format.json { render json: @vecktor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vecktors/1
  # PUT /vecktors/1.json
  def update
    @vecktor = Vecktor.find(params[:id])

    respond_to do |format|
      if @vecktor.update_attributes(params[:vecktor])
        format.html { redirect_to @vecktor, notice: 'Vecktor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vecktor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vecktors/1
  # DELETE /vecktors/1.json
  def destroy
    @vecktor = Vecktor.find(params[:id])
    @vecktor.destroy

    respond_to do |format|
      format.html { redirect_to vecktors_url }
      format.json { head :no_content }
    end
  end
end
