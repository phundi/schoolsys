class AddPunishmentIdToStudents < ActiveRecord::Migration
  def self.up
      add_column :students, :punishmentId, :integer 
   end

  def self.down
    remove_column :students, :punishmentId
  end
end
