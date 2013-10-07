class CreateProjecttags < ActiveRecord::Migration
  def change
    create_table :projecttags do |t|
      t.integer :workSectionID
      t.string :tagName

      t.timestamps
    end
  end
end
