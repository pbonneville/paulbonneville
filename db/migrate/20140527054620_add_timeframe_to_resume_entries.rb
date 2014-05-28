class AddTimeframeToResumeEntries < ActiveRecord::Migration
  def change
    change_table :resume_entries do |t|
      t.string :timeframe
    end
  end
end
