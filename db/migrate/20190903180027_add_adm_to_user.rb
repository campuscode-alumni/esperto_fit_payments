class AddAdmToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adm, :boolean, default: false
  end
end
