class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  #To do -> figure out how to validate association presence w/out breaking save
  #validates :order_item, presence: true
  has_many :products, through: :order_items

  validates :email, :mailing_address, :name_on_cc, :cc_number, :cc_expiration, :cc_cvv, :billing_zip,   presence: true

  #Would a separate checkout model be better?

  # scope :pending, -> { where(pending: true) }

end
