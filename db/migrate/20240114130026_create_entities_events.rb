class CreateEntitiesEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :entities_events do |t|
      t.belongs_to :user
      
      t.string :name
      t.text :description

      t.references :entities, null: false, foreign_key: true
      t.references :events, null: false, foreign_key: true

      t.timestamps
    end
  end
end
