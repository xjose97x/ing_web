# frozen_string_literal: true

class AddBlogTables < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.timestamps
    end

    create_table :posts, id: :uuid do |t|
      t.references :author, null: true, index: true, type: :uuid, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :content, null: false
      t.text :summary, null: false
      t.references :category, null: false, index: true, foreign_key: true
      t.timestamps
    end

    create_table :tags do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.timestamps
    end

    # Join table for posts and tags.
    # Note: it has no primary key because ideally we would want a composite primary key
    # but Rails does not support composite primary keys yet
    create_table :post_tags, id: false do |t|
      t.references :post, null: false, index: true, type: :uuid, foreign_key: true
      t.references :tag, null: false, index: true, foreign_key: true
      t.index [:post_id, :tag_id], unique: true
    end
  end
end
