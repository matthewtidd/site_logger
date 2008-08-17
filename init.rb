# Include hook code here
require "site_logger"

ActionController::Base.class_eval do
  include DMT::SiteLogger
end
