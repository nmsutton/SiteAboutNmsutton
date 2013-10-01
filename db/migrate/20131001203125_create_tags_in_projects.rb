class CreateTagsInProjects < ActiveRecord::Migration
  def change
    create_table :tags_in_projects do |t|

      t.timestamps
    end
  end
end
