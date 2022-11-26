# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                    :uuid             not null, primary key
#  content               :text             not null
#  final_score           :float
#  flesch_kincaid_score  :float
#  language_tool_matches :jsonb
#  summary               :text             not null
#  title                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  author_id             :uuid
#  category_id           :bigint           not null
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
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :interacted_users, class_name: "User", join_table: :posts_likes
  before_save :set_scores

  def set_scores
    self.flesch_kincaid_score = LanguageService.FleschKincaidScore(content)
    self.language_tool_matches = LanguageService.LanguageTool(content)[:matches]

    grammar_score = (100 - (language_tool_matches.length * 10))
    grammar_score = 0 if grammar_score < 0
    likes_score = (interacted_users.length * 10)
    self.final_score = (flesch_kincaid_score * 0.5) + (grammar_score * 0.5) + likes_score
  end
end
