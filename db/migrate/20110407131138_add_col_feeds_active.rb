class AddColFeedsActive < ActiveRecord::Migration
  def self.up
    add_column :feeds, :active, :integer, :default => 1
  end

  def self.down
    remove_column :feeds, :active
  end
end
