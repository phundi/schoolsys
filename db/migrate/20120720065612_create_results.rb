class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.primary_key :id
      t.integer :mathematics
      t.integer :english
      t.integer :chichewa
      t.integer :physical_science
      t.integer :biology
      t.integer :computer_studies
      t.integer :student_id

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
