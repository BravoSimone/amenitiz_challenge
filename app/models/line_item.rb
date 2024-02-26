class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  has_many :adjustments

  before_save :calculate_final_price

  def calculate_final_price
    self.final_price = (price * quantity) - adjustments.pluck(:amount).sum
  end
end
