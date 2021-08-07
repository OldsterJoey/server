class AddAdminProfileToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :admin_profile, foreign_key: true
  end
end
