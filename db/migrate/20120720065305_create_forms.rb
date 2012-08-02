class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.primary_key :id
      t.string :name
      t.integer :form_teacher_id
      t.integer :no_of_students
      t.integer :form_leader_id

      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
