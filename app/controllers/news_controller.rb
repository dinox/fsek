class NewsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_and_authorize_resource

  respond_to :html, :json, :xml

  # GET /news
  def index
    logger.debug params
    # Default values.
    if params.has_key? 'size' and params['size'].to_i > 0
      @size = params['size'].to_i else @size = 10
    end 
    if params.has_key? 'page' and params['page'].to_i >= 0
      @page = params['page'].to_i else @page = 0
    end
    if params.has_key? 'bare' and [1, 0].include? params['bare'].to_i
      @bare = params['bare'].to_i == 1 ? true : false 
    else 
      @bare = false
    end
    logger.debug "size=#{@size}, page=#{@page}, bare=#{@bare}"

    @news = News.find(:all, :order => 'created_at desc', 
                      :limit => @size, :offset => @page * @size)
    respond_with @news, :layout => !@bare
  end

  # GET /news/1
  def show
    @news = News.find(params[:id])
    respond_with @news
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, :notice => 'News was successfully created.' }
        format.json { render :json => @news, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.json { render :json => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, :notice => 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end
end
