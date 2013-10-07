class CreateCategorytags < ActiveRecord::Migration
  def change
    create_table :categorytags do |t|
      t.string :tag_category
      t.text :tag_name

      t.timestamps
    end
  end
end
