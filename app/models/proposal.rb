class Proposal < ApplicationRecord
  belongs_to :property
  belongs_to :user
  enum status: [:pending, :approved, :rejected]
  validates :start_date, :end_date, :rent_proposal, :total_guests, presence: true
  validate :start_date_before_end_date
  
  def set_total_amount
    self.total_amount = calculate_total_amount
  end

  private

  def calculate_total_amount
    return 0 if self.end_date.nil? || self.start_date.nil? || self.property.daily_rate.nil?
    self.total_amount = (self.end_date - self.start_date).to_i * self.property.daily_rate
  end

  def start_date_before_end_date
    if !start_date.nil? && !end_date.nil? && start_date > end_date
      errors.add(:end_date, "deve ser maior que a data de entrada")  
    end  
  end

end
