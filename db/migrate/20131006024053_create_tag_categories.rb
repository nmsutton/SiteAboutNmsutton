class CreateTagCategories < ActiveRecord::Migration
  def up
    create_table :tag_categories do |t|
      t.string :tagCategory
      t.string :tagName
      
      t.timestamps
    end
  end

  def down
  end  
end
