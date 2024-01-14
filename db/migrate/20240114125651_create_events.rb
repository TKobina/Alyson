class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.belongs_to :user
      
      t.string :name
      t.datetime :event_start
      t.datetime :event_end
      t.text :story
      
      
      t.timestamps
    end
  end
end
