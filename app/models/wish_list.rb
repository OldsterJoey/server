class WishList < ApplicationRecord
  belongs_to :child_profile
  has_many :wishes
end
