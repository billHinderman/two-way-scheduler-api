class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :key
      t.json :payload

      t.timestamps
    end

    add_index :calendars, :key,  unique: true
  end
end
