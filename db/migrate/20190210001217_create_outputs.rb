class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.references :item, foreign_key: true
      t.datetime :output_date
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
