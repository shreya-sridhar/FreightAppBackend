class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :address
      t.string :email
      t.text :wallet
      t.float :driver_star_rating
      t.float :customer_star_rating
      t.string :status
      t.boolean :is_driver
      t.string :vehicle_type
      t.string :vehicle_number
      t.string :password_digest
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
