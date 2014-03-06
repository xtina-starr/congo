class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  #To do -> figure out how to validate association presence w/out breaking save
  #validates :order_item, presence: true
  has_many :products, through: :order_items

  validates_presence_of :email, :name_on_cc, :cc_number, :cc_expiration, :cc_cvv, :billing_zip, :street_address, :city, :state, :country, if: :iscompleted?
  #http://edgeguides.rubyonrails.org/active_record_validations.html#using-a-symbol-with-if-and-unless

  #Validation still broken -> Kerri is researching.

  def iscompleted?
    status == "completed"
  end

  # TO FIX: this validation causes a new order to crash because it asks for this info before the payment/checkout page.

  # Would a separate checkout model be better?

  # scope :pending, -> { where(pending: true) }

  def subtotals
    order_items.reduce
  end


  def shipping_options
    weight = 0
    length = 0
    height = 0
    width  = 0
    products.each do |product|
      weight += product.weight
      length += product.length
      height += product.height
      width  += product.width
    end
    options = { body:  {
                        packages: {
                                    width:  width,
                                    length: length,
                                    height: height,
                                    weight: weight
                         },
                         destination: {
                                       country:     country,
                                       province:    state,
                                       city:        city,
                                       postal_code: billing_zip
                                       }
                        } }
    HTTParty.post('http://localhost:4000/index.json', options )
  end

  def shipping_ops
    shipping = []
    if shipping_options.response.message.include?("OK")
        shipping_options.parsed_response["ups"].each do |r|
          r["price_in_cents"] = r["price_in_cents"].to_f/100
        shipping << r.values.join(": $")
      end
        shipping_options.parsed_response["fedex"].each do |r|
          r["price_in_cents"] = r["price_in_cents"].to_f/100
        shipping << r.values.join(": $")
      end
      shipping
    end
  end


end
