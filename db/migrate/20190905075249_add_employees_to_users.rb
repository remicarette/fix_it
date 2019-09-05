class AddEmployeesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employees, :string
  end
end
