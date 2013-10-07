class CreateClasstags < ActiveRecord::Migration
  def change
    create_table :classtags do |t|
      t.integer :workSectionID
      t.string :tagName

      t.timestamps
    end
  end
end
