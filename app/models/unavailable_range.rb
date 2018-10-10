class UnavailableRange < ApplicationRecord

  validates :start_date, :end_date, :description, presence: true
  belongs_to :property
  validate :start_date_before_end_date

  def start_date_before_end_date
    if !start_date.nil? && !end_date.nil? && start_date > end_date
      errors.add(:end_date, "deve ser maior que a data de entrada")  
    end  
  end

end
