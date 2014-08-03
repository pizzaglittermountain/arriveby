class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :start_location
      t.text :end_location
      t.datetime :arrival_time
      t.datetime :departure_time
      t.datetime :duration
      t.string :phone_number

      t.timestamps

    end
  end
end
