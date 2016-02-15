class AddBooleanAutopostToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :autopost, :boolean, :default => false
  end
end
