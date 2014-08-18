class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :mac_address
      t.string :ip_address
      t.string :name
      t.string :authorization

      t.timestamps
    end
  end
end
