class AddDoctorIdToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :doctor_id, :integer
  end
end
