class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.string  :key,   null: false
      t.string  :slug,  null: false

      t.timestamp :enable_at
      t.timestamp :expire_at
      t.integer :status, null: false

      t.integer :length, null: false

      t.references :requesting_employer, index: true
      t.references :requesting_talent, index: true

      t.timestamps
    end

    add_index :interviews, :key,  unique: true
    add_index :interviews, :slug, unique: true
  end
end
