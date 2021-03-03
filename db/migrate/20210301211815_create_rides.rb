class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.string :pickup_location
      t.string :drop_location
      t.float :pickup_lat
      t.float :pickup_lng
      t.float :drop_lat
      t.float :drop_lng
      t.float :estimated_bill
      t.float :actual_bill
      t.datetime :pickup_time
      t.float :discount
      t.string :vehicle_type
      t.string :status
      t.references :driver, foreign_key: { to_table: 'users' }
      t.references :customer, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
