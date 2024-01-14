class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.belongs_to :user
      
      t.string :name
      t.text :description

      t.references :left, null: false
      t.references :right, null: false
      
      t.timestamps
    end
  end
end
