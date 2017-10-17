class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true
  validates :stripe_charge_id, presence: true

  after_create :deduct_quantity

  private
    def deduct_quantity
      line_items.each do |i|
        i.product.quantity -= i.quantity
        i.product.save
      end
    end

end
