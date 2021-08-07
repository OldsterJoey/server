class AddUserToAdminProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :admin_profiles, :user, null: false, foreign_key: true
  end
end
