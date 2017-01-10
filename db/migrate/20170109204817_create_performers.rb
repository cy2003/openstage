class CreatePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :performers do |t|

      t.string :category
      t.string :genre
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
