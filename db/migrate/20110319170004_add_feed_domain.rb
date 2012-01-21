class AddFeedDomain < ActiveRecord::Migration
  def self.up
    add_column :feeds, :domain, :string
  end

  def self.down
    remove_column :feeds, :domain
  end
end
