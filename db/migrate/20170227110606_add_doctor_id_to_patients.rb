class AddDoctorIdToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :doctor_id, :integer
  end
end
