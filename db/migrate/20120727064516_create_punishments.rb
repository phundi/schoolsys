class CreatePunishments < ActiveRecord::Migration
  def self.up
    create_table :punishments do |t|
      t.primary_key :id
      t.text :description
      t.string :status
      t.date :due_date

      t.timestamps
    end
  end

  def self.down
    drop_table :punishments
  end
end
