class Dmt::SiteLogger::Log < ActiveRecord::Base
  set_table_name 'dmt_site_logger_logs'
  
  validates_presence_of :controller
  validates_presence_of :action
  validates_presence_of :params
  validates_presence_of :browser
  validates_presence_of :ipaddr
  validates_presence_of :referer

end
