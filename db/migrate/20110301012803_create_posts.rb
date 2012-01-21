class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.string :p_url
      t.string :p_title
      t.string :p_ip
      t.string :flagged_ip
      t.string :ihash
      t.integer :clicks, :default => 0
      t.integer :votes, :default => 1
      t.integer :points, :default => 1
      t.integer :status_id, :default => 0
      t.integer :category_id
      t.integer :flagged_id, :default => 0
      t.datetime :approved_at

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
