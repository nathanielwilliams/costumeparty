class CreateWrestlers < ActiveRecord::Migration
  def change
    create_table :wrestlers do |t|
      t.text :name
      t.text :image
      t.text :slogan

      t.timestamps null: false
    end
  end
end
