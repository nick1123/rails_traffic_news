class AddTableTwitterFeeds < ActiveRecord::Migration
  def self.up
    create_table :twitter_feeds do |t|
      t.string :name
      t.string :handle
      t.integer :active, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_feeds
  end
end
