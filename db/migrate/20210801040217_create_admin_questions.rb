class CreateAdminQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_questions do |t|
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
