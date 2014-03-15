class RenameTypeOnRequestsToRecordType < ActiveRecord::Migration
  def change
    rename_column :requests, :type, :record_type
  end
end
