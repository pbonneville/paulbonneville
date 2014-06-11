class CreatePortfolioEntriesSkillTagsTable < ActiveRecord::Migration
	def change
		create_table :portfolio_entries_skill_tags do |t|
			t.belongs_to :portfolio_entry
			t.belongs_to :skill_tag
		end
	end
end
