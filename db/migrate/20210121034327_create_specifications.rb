class CreateSpecifications < ActiveRecord::Migration[5.2]
  def change
    create_table :specifications do |t|

      t.timestamps
    end
  end
end
