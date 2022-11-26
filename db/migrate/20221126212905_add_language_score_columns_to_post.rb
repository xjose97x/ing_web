# frozen_string_literal: true

class AddLanguageScoreColumnsToPost < ActiveRecord::Migration[7.0]
  def change
    change_table :posts, bulk: true do |t|
      t.float :flesch_kincaid_score
      t.jsonb :language_tool_matches
      t.float :final_score
    end
  end
end
