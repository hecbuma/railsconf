class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :day
      t.string :room
      t.string :event_type
      t.string :event
      t.string :time
      t.string :speaker

      t.timestamps
    end
  end
end
