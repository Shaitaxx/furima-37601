class CreateShippers < ActiveRecord::Migration[6.0]
  def change
    create_table :shippers do |t|
      t.string      :postcode,     null: false
      t.integer     :region_id,    null: false
      t.string      :region_id,    null: false
      t.string      :address,      null: false
      t.string      :building
      t.string      :phonenumber,  null: false
      t.references  :purchase,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
