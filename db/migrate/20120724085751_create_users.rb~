class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.primary_key :id
      t.string :login_name
      t.string :login_password
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
