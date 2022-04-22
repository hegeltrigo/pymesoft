class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :productable, polymorphic: true
      t.references :sale, foreign_key: true
      t.string :detail
      t.integer :quantiy
      t.decimal :unit_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
