class Dmt::SiteLogger::LogsController < ApplicationController
  # GET /dmt/site_logger/logs
  # GET /dmt/site_logger/logs.xml
  def index
    @logs = Dmt::SiteLogger::Log.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end

  # GET /dmt/site_logger/logs/1
  # GET /dmt/site_logger/logs/1.xml
  def show
    @log = Dmt::SiteLogger::Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # GET /dmt/site_logger/logs/new
  # GET /dmt/site_logger/logs/new.xml
  def new
    @log = Dmt::SiteLogger::Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # GET /dmt/site_logger/logs/1/edit
  def edit
    @log = Dmt::SiteLogger::Log.find(params[:id])
  end

  # POST /dmt/site_logger/logs
  # POST /dmt/site_logger/logs.xml
  def create
    @log = Dmt::SiteLogger::Log.new(params[:dmt_site_logger_log])

    respond_to do |format|
      if @log.save
        flash[:notice] = 'Dmt::SiteLogger::Log was successfully created.'
        format.html { redirect_to(@log) }
        format.xml  { render :xml => @log, :status => :created, :location => @log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dmt/site_logger_logs/1
  # PUT /dmt/site_logger_logs/1.xml
  def update
    @log = Dmt::SiteLogger::Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:dmt_site_logger_log])
        format.html { redirect_to(@log) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dmt/site_logger_logs/1
  # DELETE /dmt/site_logger_logs/1.xml
  def destroy
    @log = Dmt::SiteLogger::Log.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to(dmt_site_logger_logs_url) }
      format.xml  { head :ok }
    end
  end
end
