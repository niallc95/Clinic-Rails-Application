class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.text :date
      t.text :report

      t.timestamps
    end
  end
end
