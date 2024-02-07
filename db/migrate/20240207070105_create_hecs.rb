class CreateHecs < ActiveRecord::Migration[7.1]
  def change
    create_table :hecs do |t|
      t.string :country
      t.belongs_to :user

      t.timestamps
    end
  end
end
