class Proposal < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :start_date, :end_date, :rent_proposal, :total_guests, presence: true
def set_total_amount
  self.total_amount = calculate_total_amount
end


private 
  def calculate_total_amount
    return 0 if self.end_date.nil? || self.start_date.nil? || self.property.daily_rate.nil?
    self.total_amount = (self.end_date - self.start_date).to_i * self.property.daily_rate
  end



end
