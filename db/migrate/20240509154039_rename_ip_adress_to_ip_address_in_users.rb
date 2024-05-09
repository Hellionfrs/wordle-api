class RenameIpAdressToIpAddressInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :ip_adress, :ip_address
  end
end
