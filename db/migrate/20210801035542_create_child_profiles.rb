class CreateChildProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :child_profiles do |t|
      t.string :name
      t.string :string

      t.timestamps
    end
  end
end
