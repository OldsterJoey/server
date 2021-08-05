class Question < ApplicationRecord
    belongs_to :admin_profile, optional: true
end
