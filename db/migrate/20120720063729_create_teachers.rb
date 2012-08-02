class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.primary_key :id
      t.string :first_name
      t.string :initial
      t.string :surname
      t.date :date_of_birth
      t.string :marital_status
      t.integer :subject_id

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
