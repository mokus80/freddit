class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :content
      t.string :name

      t.timestamps
    end
  end
end
