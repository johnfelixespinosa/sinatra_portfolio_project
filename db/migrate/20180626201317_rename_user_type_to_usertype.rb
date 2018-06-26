class RenameUserTypeToUsertype < ActiveRecord::Migration
  def change
    rename_column :users, :user_type, :usertype
  end
end
