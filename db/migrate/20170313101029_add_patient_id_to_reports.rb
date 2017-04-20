class AddPatientIdToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :patient_id, :integer
  end
end
