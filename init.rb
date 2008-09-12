# Include hook code here
require "site_logger"

ActionController::Base.class_eval do
  include DMT::SiteLogger
end

ActionView::Base.send :include, DMT::SiteLogger::ViewHelpers
