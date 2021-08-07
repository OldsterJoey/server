class AddUserToChildProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :child_profiles, :user, null: false, foreign_key: true
  end
end
