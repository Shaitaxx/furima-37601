class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.string      :name,              null: false
      t.text        :explanation,       null: false
      t.integer     :category_id,       null: false
      t.integer     :status_id,         null: false
      t.integer     :charge_id,         null: false
      t.integer     :region_id,         null: false
      t.integer     :shipping_date_id,  null: false
      t.integer     :price,             null: false
      t.references  :user,              null: false, foreign_key: true
      t.integer     :genre_id,          null: false
      t.timestamps
    end
  end
end