class CreateClasses < ActiveRecord::Migration
  def up
    create_table :classes do |t|
      t.string :time_range
      t.text :description
      
      t.timestamps
    end
  end

  def down
  end 
end
