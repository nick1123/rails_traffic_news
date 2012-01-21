class AddColPostsTitleDisplay < ActiveRecord::Migration
  def self.up
    add_column :posts, :title_display, :string
  end

  def self.down
    remove_column :posts, :title_display
  end
end
