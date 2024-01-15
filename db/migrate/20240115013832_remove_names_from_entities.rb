class RemoveNamesFromEntities < ActiveRecord::Migration[7.1]
  def change
    remove_column :entities, :last, :string
    remove_column :entities, :first, :string
  end
end
