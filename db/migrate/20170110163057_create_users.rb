class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.integer :phone_number
      t.integer :owner_id
      t.integer :performer_id
      t.integer :promoter_id

      t.timestamps
    end
  end
end
