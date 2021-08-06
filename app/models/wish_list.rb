class WishList < ApplicationRecord
  belongs_to :child_profile
  has_many :wishes
  accepts_nested_attributes_for :wishes
end
