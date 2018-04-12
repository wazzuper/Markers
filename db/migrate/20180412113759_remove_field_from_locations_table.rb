class RemoveFieldFromLocationsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :address, :string
  end
end
