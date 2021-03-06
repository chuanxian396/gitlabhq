class CreateEnvironmentNameUniqueIndex < ActiveRecord::Migration
  include Gitlab::Database::MigrationHelpers

  disable_ddl_transaction!

  DOWNTIME = true
  DOWNTIME_REASON = 'Making a non-unique index into a unique index'

  def up
    remove_index :environments, [:project_id, :name]
    add_concurrent_index :environments, [:project_id, :name], unique: true
  end

  def down
    remove_index :environments, [:project_id, :name]
    add_concurrent_index :environments, [:project_id, :name], unique: true
  end
end
