class AddConditionIdToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :condition_id, :integer
  end
end
