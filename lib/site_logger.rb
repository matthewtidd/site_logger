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
        @data = "test 2!"
      end
    end

  end
end
