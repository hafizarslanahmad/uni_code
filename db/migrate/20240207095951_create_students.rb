class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :program
      t.string :f_name
      t.belongs_to :university

      t.timestamps
    end
  end
end
