class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.belongs_to :user

      t.string :name
      t.string :last
      t.string :first
      t.text :about

      t.timestamps
    end
  end
end
