class CreateUnavailableRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailable_ranges do |t|
      t.date :start_date
      t.date :end_date
      t.string :description
      t.timestamps
    end
  end
end
