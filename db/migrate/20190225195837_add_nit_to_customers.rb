class AddNitToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :nit, :string
  end
end
