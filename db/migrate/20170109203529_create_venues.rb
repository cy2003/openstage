class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :promoter_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
