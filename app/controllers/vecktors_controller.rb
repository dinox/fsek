class VecktorsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_and_authorize_resource

  # GET /vecktors
  def index
    @vecktors = Vecktor.find :all, :order => 'date desc', 
                             :conditions  => { :published => true }
    @year_vecktors = @vecktors.group_by { |v| v.date.year }
    @sanning  = Role.where(:tag => :sanning).first.users.first
    @deadline = Vecktor.setting :deadline
  end

  # GET /vecktors/1
  def show
    # Om vi inte får nåt id-nummer, visa senaste vecktorn. (se rutten 'vecktorn')
    if params[:id]
      @vecktor = Vecktor.find(params[:id])
    else
      @vecktor = Vecktor.first :order => 'date desc'
    end

    @notices = @vecktor.notices.sort { |n| n.order_ }
   end

  # GET /vecktors/new
  def new
    @vecktor = Vecktor.new
  end

  # GET /vecktors/1/edit
  def edit
    @vecktor = Vecktor.find(params[:id])
  end

  # POST /vecktors
  def create
    @vecktor = Vecktor.new(params[:vecktor])

    if @vecktor.save
      redirect_to @vecktor, notice: 'Vecktor was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /vecktors/1
  def update
    @vecktor = Vecktor.find(params[:id])

    if @vecktor.update_attributes(params[:vecktor])
      redirect_to @vecktor, notice: 'Vecktor was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /vecktors/1
  def destroy
    @vecktor = Vecktor.find(params[:id])
    @vecktor.destroy

    redirect_to vecktors_url
  end
end
