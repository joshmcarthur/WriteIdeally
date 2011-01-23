class DeviseCreateAdminUsers < ActiveRecord::Migration
  def self.up
    create_table(:admin_users) do |t|
      t.database_authenticatable :null => false
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both


      t.timestamps
    end

    add_index :admin_users, :email,                :unique => true
    add_index :admin_users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :admin_users
  end
end

