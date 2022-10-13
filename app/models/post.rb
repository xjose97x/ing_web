# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :uuid             not null, primary key
#  content     :text             not null
#  summary     :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :uuid
#  category_id :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id    (author_id)
#  index_posts_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  has_and_belongs_to_many :tags
end
