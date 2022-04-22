class AddClientType < ActiveRecord::Migration[5.2]
  def up
    add_column :customers, :client_type, :integer 
  end

  def down
    remove_column :customers, :client_type
  end
end
