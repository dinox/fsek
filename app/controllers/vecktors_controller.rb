class VecktorsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_and_authorize_resource
  # GET /vecktors
  # GET /vecktors.json
  def index
    @vecktors = Vecktor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vecktors }
    end
  end

  # GET /vecktors/1
  # GET /vecktors/1.json
  def show
    @vecktor = Vecktor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vecktor }
    end
  end

  # GET /vecktors/new
  # GET /vecktors/new.json
  def new
    @vecktor = Vecktor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vecktor }
    end
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
