class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :upc
      t.string :sku
      t.string :name
      t.text :description
      t.integer :input, default: 0
      t.integer :output, default: 0
      t.integer :amount_stock, default: 0
      t.decimal :price
      t.decimal :cost_price
      t.boolean :published, default: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
