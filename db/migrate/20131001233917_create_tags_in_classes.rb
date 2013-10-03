class CreateTagsInClasses < ActiveRecord::Migration
  def up
    create_table :tags_in_classes do |t|
      t.integer :workSectionID
      t.string :tagName
      
      t.timestamps
    end
  end

  def down
  end      
end
