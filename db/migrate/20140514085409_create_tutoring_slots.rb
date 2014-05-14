class CreateTutoringSlots < ActiveRecord::Migration
  def change
    create_table :tutoring_slots do |t|
      t.datetime :session_datetime

      t.timestamps
    end
  end
end
