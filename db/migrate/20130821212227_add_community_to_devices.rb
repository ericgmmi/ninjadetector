class AddCommunityToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :community, :string
  end
end
