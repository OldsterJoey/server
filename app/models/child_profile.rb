class ChildProfile < ApplicationRecord
    has_one :wish_list
    belongs_to :user
end
