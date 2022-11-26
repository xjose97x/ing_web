# frozen_string_literal: true

class CreatePostLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :posts_likes do |t|
      t.references :post, null: false, index: true, type: :uuid, foreign_key: true
      t.references :user, null: false, index: true, type: :uuid, foreign_key: true
      t.timestamps

      t.index [:post_id, :user_id], unique: true
    end
  end
end
