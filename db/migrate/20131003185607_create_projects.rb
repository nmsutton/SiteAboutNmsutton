class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.string :time_range
      t.text :description
      
      t.timestamps      
    end
  end

  def down
  end
end
