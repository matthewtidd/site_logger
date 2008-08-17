class CreateDmtSiteLoggerLogs < ActiveRecord::Migration
  def self.up
    create_table :dmt_site_logger_logs do |t|
      t.string :controller
      t.string :action
      t.string :params
      t.string :browser
      t.string :ipaddr
      t.string :referer

      t.timestamps
    end
  end

  def self.down
    drop_table :dmt_site_logger_logs
  end
end
