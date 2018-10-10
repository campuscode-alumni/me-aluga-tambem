class Proposal < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :start_date, :end_date, :rent_proposal, :total_guests, presence: true
  def set_total_amount
    self.total_amount = calculate_total_amount
  end

private 
  def calculate_total_amount
    
    return unless self.valid?
    price = 0
  

    (self.start_date..(self.end_date - 1)).each do |day|
      price_range_day = property.price_ranges.where('start_date <= :date and end_date >= :date', date: day).last
      
      if price_range_day.nil?
        price += property.daily_rate
      else
        price += price_range_day.daily_rate
      end
    end
    price
  end

end
