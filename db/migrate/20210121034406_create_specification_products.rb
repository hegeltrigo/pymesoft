class CreateSpecificationProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :specification_products do |t|

      t.timestamps
    end
  end
end
