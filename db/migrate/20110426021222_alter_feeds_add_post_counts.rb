class AlterFeedsAddPostCounts < ActiveRecord::Migration
  def self.up
    add_column :feeds, :post_count, :integer, :default => 1
    add_column :feeds, :vote_count, :integer, :default => 1
  end

  def self.down
    remove_column :feeds, :post_count
    remove_column :feeds, :vote_count
  end
end
