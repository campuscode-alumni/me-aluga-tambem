class AddStatusChangedAtToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :status_changed_at, :datetime
  end
end
