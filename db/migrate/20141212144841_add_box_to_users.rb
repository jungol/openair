class AddBoxToUsers < ActiveRecord::Migration
  def change
    add_column :users, :box, :string
  end
end
