class AddAgminIdToUniversities < ActiveRecord::Migration[7.1]
  def change
    add_column :universities, :admin_id, :string
  end
end
