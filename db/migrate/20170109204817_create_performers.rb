class CreatePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :performers do |t|
      t.string :performer_name
      t.string :first_name_contact
      t.string :last_name_contact
      t.integer :phone_number
      t.string :email_address
      t.boolean :is_performer, default: true
      t.string :category
      t.string :password_digest
      t.string :genre
      t.string :description

      t.timestamps
    end
  end
end
