class AddWrestlerIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :wrestler, index: true, foreign_key: true
  end
end
