class CreatePromoters < ActiveRecord::Migration[5.0]
  def change
    create_table :promoters do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
