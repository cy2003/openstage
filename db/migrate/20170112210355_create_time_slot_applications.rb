class CreateTimeSlotApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slot_applications do |t|
      t.string :status
      t.integer :performer_id
      t.integer :time_slot_id

      t.timestamps
    end
  end
end
