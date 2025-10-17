class AddStatusToLists < ActiveRecord::Migration[8.0]
  def change
    add_column :lists, :status, :string
  end
end
