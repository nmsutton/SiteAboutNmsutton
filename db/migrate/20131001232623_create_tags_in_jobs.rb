class CreateTagsInJobs < ActiveRecord::Migration
  def change
    create_table :tags_in_jobs do |t|

      t.timestamps
    end
  end
end
