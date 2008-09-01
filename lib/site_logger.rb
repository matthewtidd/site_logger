# SiteLogger
module DMT
  module SiteLogger

    def self.included(mod)
      mod.extend(ClassMethods)
    end

    module ClassMethods
      def dmt_site_logger(args={ :except => '' })
        self.send(:before_filter, :dmt_site_logger, args)
        extend DMT::SiteLogger::SingletonMethods
        include DMT::SiteLogger::InstanceMethods
      end
    end

    module SingletonMethods

    end

    module InstanceMethods
      def dmt_site_logger
        data = Hash.new
        data = { 'controller' => params[:controller],
          'action' => params[:action],
          'params' => params.to_yaml,
          'ipaddr' => request.remote_addr,
          'referer' => request.env['HTTP_REFERER'],
          'browser' => request.user_agent }
        log = Dmt::SiteLogger::Log.new(data)
        log.save
      end
    
      def dmt_site_logger_count
        Dmt::SiteLogger::Log.count
      end
    end

  end
end
