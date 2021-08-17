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
                
                post '/api/child_profiles', params: { child_profile: { name: 'Little Bimmy' } }, headers: authenticated_header(user)
            }.to change { ChildProfile.count }.from(0).to(1)

                expect(response).to have_http_status(201)
            end
        end
    end

    describe '/DELETE child_profiles' do
    context 'with an authenticated user' do
        let(:user) { create(:user) }
         it 'successfully deletes a child profile' do
                FactoryBot.create(:child_profile, user_id: 1 ,name: 'Little Slimmy',)
                delete '/api/child_profiles/1', headers: authenticated_header(user)

                expect(response).to have_http_status(404)
            end
        end
    end
end

