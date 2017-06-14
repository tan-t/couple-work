class PayItem < ApplicationRecord
  has_many :pay_item_details
  accepts_nested_attributes_for :pay_item_details,allow_destroy:true
end
