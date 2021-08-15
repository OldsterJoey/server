require 'rails_helper'

describe 'child_profiles', type: :request do
    it 'returns at least two child_profiles' do
        FactoryBot.create(:child_profile, user_id: 1 ,name: 'Little Timmy',)
        get '/api/child_profiles'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
    end
end

