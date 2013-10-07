class CreateJobtags < ActiveRecord::Migration
  def change
    create_table :jobtags do |t|
      t.integer :workSectionID
      t.string :tagName

      t.timestamps
    end
  end
end
