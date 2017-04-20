class AddFieldsToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :clinic_id, :string
  end
end
