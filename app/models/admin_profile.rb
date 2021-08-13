class AdminProfile < ApplicationRecord    
  include ActiveModel::Serialization
  has_many :questions
  belongs_to :user

  def transform_admin
      return { 
      username: self.user.username,
      name: self.name, 
      posted: self.created_at, 
      edited: self.updated_at
      }
  end 
end
