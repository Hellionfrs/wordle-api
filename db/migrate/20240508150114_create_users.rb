class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :ip_adress
      t.string :game_status

      t.timestamps
    end
  end
end
