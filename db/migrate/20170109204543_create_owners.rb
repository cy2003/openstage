class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :email_address
      t.boolean :is_owner, default: true
      t.string :password_digest

      t.timestamps
    end
  end
end
