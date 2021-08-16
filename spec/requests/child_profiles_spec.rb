require 'rails_helper'
require 'api_helper'

def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'Authorization': "Bearer #{token}" }
end

describe 'child_profiles', type: :request do
    describe '/GET child_profiles' do
        it 'returns two child_profiles' do
            FactoryBot.create(:child_profile, user_id: 1 ,name: 'Little Timmy',)
            FactoryBot.create(:child_profile, user_id: 1 ,name: 'Little Jimmy',)
            get '/api/child_profiles'
    
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(2)
        end       
    end

    describe '/POST child_profiles' do
    context 'with an authenticated user' do
        let(:user) { create(:user) }
        it 'creates a new child_profile' do
            expect {
                authenticated_header(user)
                post '/api/child_profiles', params: { child_profile: { name: 'Little Bimmy' } }
            }.to change { ChildProfile.count }.from(0).to(1)

                expect(response).to have_http_status(201)
            end
        end
    end
end

