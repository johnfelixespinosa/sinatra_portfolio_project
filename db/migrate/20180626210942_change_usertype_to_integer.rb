class ChangeUsertypeToInteger < ActiveRecord::Migration
  def change
    change_column :users, :usertype, :integer
  end
end
