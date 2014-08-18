class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :ip_address
      t.string :device_type
      t.string :city

      t.timestamps
    end
  end
end
