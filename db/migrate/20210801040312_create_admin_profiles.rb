class CreateAdminProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_profiles do |t|
      t.string :name
      t.references :adminquestion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
