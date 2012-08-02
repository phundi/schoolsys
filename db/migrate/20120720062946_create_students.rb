class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.primary_key :id
      t.string :first_name
      t.string :initial
      t.string :surname
      t.date :date_of_birth
      t.string :position
      t.integer :form_id

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
