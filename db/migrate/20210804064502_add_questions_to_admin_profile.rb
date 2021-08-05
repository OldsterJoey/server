class AddQuestionsToAdminProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :admin_profiles, :question
  end
end
