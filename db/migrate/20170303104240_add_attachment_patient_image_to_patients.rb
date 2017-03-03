class AddAttachmentPatientImageToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.attachment :patient_image
    end
  end

  def self.down
    remove_attachment :patients, :patient_image
  end
end
