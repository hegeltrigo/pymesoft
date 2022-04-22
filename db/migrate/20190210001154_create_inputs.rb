class CreateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :inputs do |t|
      t.references :item, foreign_key: true
      t.datetime :input_date
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
