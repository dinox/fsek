class VecktorNoticesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_and_authorize_resource
  # GET /vecktor_notices
  # GET /vecktor_notices.json
  def index
    @vecktor_notices = VecktorNotice.where :published => true

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vecktor_notices }
    end
  end

  # GET /vecktor_notices/1
  # GET /vecktor_notices/1.json
  def show
    @vecktor_notice = VecktorNotice.find(params[:id])
#    @notices = VecktorNotice.where(:vecktor_notice_id => @vecktor_notice.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vecktor_notice }
    end
  end

  # GET /vecktor_notices/new
  # GET /vecktor_notices/new.json
  def new
    @vecktor_notice = VecktorNotice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vecktor_notice }
    end
  end

  # GET /vecktor_notices/1/edit
  def edit
    @vecktor_notice = VecktorNotice.find(params[:id])
  end

  # POST /vecktor_notices
  # POST /vecktor_notices.json
  def create
    @vecktor_notice = VecktorNotice.new(params[:vecktor_notice])

    respond_to do |format|
      if @vecktor_notice.save
        format.html { redirect_to @vecktor_notice, notice: 'VecktorNotice was successfully created.' }
        format.json { render json: @vecktor_notice, status: :created, location: @vecktor_notice }
      else
        format.html { render action: "new" }
        format.json { render json: @vecktor_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vecktor_notices/1
  # PUT /vecktor_notices/1.json
  def update
    @vecktor_notice = VecktorNotice.find(params[:id])

    respond_to do |format|
      if @vecktor_notice.update_attributes(params[:vecktor_notice])
        format.html { redirect_to @vecktor_notice, notice: 'VecktorNotice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vecktor_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vecktor_notices/1
  # DELETE /vecktor_notices/1.json
  def destroy
    @vecktor_notice = VecktorNotice.find(params[:id])
    @vecktor_notice.destroy

    respond_to do |format|
      format.html { redirect_to vecktor_notices_url }
      format.json { head :no_content }
    end
  end
end
