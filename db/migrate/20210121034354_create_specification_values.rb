class CreateSpecificationValues < ActiveRecord::Migration[5.2]
  def change
    create_table :specification_values do |t|

      t.timestamps
    end
  end
end
