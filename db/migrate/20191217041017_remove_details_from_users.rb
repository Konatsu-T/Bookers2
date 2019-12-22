class RemoveDetailsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :title, :string
    remove_column :users, :body, :text
  end
end
