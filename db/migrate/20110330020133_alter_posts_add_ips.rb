class AlterPostsAddIps < ActiveRecord::Migration
  def self.up
    add_column :posts, :ips, :text
  end

  def self.down
    remove_column :posts, :ips
  end
end
