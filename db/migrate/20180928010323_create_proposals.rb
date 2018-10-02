class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.date :start_date
      t.date :end_date
      t.string :rent_proposal
      t.integer :total_guests

      t.timestamps
    end
  end
end
