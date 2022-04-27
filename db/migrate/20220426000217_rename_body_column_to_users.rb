class RenameBodyColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :body, :introduction
  end
end
