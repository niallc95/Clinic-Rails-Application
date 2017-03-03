class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :dob
      t.string :bloodtype
      t.string :alergies

      t.timestamps
    end
  end
end
