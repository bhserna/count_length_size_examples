require_relative "config"

ActiveRecord::Schema.define(version: 1) do
  create_table :posts, if_not_exists: true do |t|
    t.column :title, :string
    t.column :body, :text
    t.column :likes_count, :integer
  end

  create_table :comments, if_not_exists: true do |t|
    t.column :body, :text
    t.column :post_id, :integer
  end

  create_table :likes, if_not_exists: true do |t|
    t.column :post_id, :integer
  end

  add_index :comments, :post_id, if_not_exists: true
end