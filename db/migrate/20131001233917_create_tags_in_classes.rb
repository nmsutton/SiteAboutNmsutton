class CreateTagsInClasses < ActiveRecord::Migration
  def change
    create_table :tags_in_classes do |t|

      t.timestamps
    end
  end
end
