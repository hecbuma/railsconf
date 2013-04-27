class AddCustomIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :custom_id, :string
  end
end
