class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  #To do -> figure out how to validate association presence w/out breaking save
  #validates :order_item, presence: true
  has_many :products, through: :order_items

  # validates :email, :mailing_address, :name_on_cc, :cc_number, :cc_expiration, :cc_cvv, :billing_zip,   presence: true
  # TO FIX: this validation causes a new order to crash because it asks for this info before the payment/checkout page.

  #Would a separate checkout model be better?

  # scope :pending, -> { where(pending: true) }

  # def total_price
  #   total_price = order_items.inject(0) { |sum, p| sum + p.subtotal }
  # end

  def subtotals
    order_items.reduce
  end

  def total
    t = 0
    order_items.each{|oi|t+=oi.subtotal}
    return t
  end
end
