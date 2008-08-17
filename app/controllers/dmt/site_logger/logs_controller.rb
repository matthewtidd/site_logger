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
end
