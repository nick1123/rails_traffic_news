class AddPostDomain < ActiveRecord::Migration
  def self.up
    add_column :posts, :domain, :string
  end

  def self.down
    remove_column :posts, :domain
  end
end
