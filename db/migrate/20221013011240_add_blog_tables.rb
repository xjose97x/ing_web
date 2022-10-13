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

    create_join_table :posts, :tags
  end
end
