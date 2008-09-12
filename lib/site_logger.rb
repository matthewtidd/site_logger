# SiteLogger
module DMT
  module SiteLogger

    def self.included(mod)
      mod.extend(ClassMethods)
    end

    module ClassMethods
      def dmt_site_logger(args=Hash.new())
        self.send(:after_filter, :dmt_site_logger, args)
        extend DMT::SiteLogger::SingletonMethods
        include DMT::SiteLogger::InstanceMethods
      end
    end

    module SingletonMethods
    end

    module InstanceMethods

      attr_accessor :dmt_site_logger_flag

      def dmt_site_logger_disable
        self.dmt_site_logger_flag = true
      end

      def dmt_site_logger
        if !self.dmt_site_logger_flag
          data = Hash.new
          data = { 'controller' => params[:controller],
            'action' => params[:action],
            'user' => params[:user],
            'path_uri' => request.env['REQUEST_URI'],
            'params' => params.to_yaml,
            'ipaddr' => request.remote_addr,
            'referer' => request.env['HTTP_REFERER'],
            'browser' => request.user_agent }
          log = Dmt::SiteLogger::Log.new(data)
          log.save
        end
      end
    end

    module ViewHelpers
      def dmt_site_logger_count
        Dmt::SiteLogger::Log.count
      end
    end

  end
end
