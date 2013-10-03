class CreateJobs < ActiveRecord::Migration
  def up
    create_table :jobs do |t|
      t.string :time_range
      t.string :description
      
      t.timestamps
    end
  end

  def down
  end  
end
