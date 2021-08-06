class RemoveColumnFromChildProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :child_profiles, :string
  end
end
