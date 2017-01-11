class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.integer :venue_id
      t.integer :performer_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :age_restriction, default: "All Ages"
      t.string :status, default: "Available"

      t.timestamps
    end
  end
end
