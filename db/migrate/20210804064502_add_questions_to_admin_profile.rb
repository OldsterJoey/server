class AddQuestionsToAdminProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :admin_profile, :question
  end
end
