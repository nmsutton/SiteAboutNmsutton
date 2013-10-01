class CreateTagCategories < ActiveRecord::Migration
  def change
    create_table :tag_categories do |t|

      t.timestamps
    end
  end
end
