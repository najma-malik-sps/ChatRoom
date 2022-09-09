class CreateRoomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_users do |t|
      t.references :user, index: true
      t.references :room, index: true

      t.timestamps
    end
  end
end
