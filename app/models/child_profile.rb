class ChildProfile < ApplicationRecord
    include ActiveModel::Serialization
    has_one :wish_list
    belongs_to :user
    has_many :wishes, through: :wish_list
    accepts_nested_attributes_for :wish_list
end
