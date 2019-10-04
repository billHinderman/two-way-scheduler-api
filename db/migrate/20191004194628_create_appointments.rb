class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :key

      t.boolean :is_confirmed_employer, null: false
      t.boolean :is_confirmed_talent, null: false
      t.integer :status, null: false

      t.integer :length, null: false
      t.timestamp :start_at

      t.timestamps
    end

    add_index :appointments, :key,  unique: true

    add_reference :appointments, :interview, index: true
  end
end
