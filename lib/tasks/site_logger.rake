namespace :dmt do
	namespace :site_logger do
		desc "Migrate the database for the site_logger plugin."
		task :migrate => :environment do
			ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
			ActiveRecord::Migrator.migrate("vendor/plugins/site_logger/db/migrate", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
			Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
		end
	end
end
