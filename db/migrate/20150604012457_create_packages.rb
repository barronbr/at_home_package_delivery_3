class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :tracking_number
      t.integer :user_id
      t.string :carrier

      t.timestamps

    end
  end
end
