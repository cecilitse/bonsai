require 'rails_helper'

RSpec.describe 'Garden - Plant creation', version: 1, type: :request do
  let!(:user)     { create(:user, email: 'nicolas@mail.com', password: 'amazing-plants') }
  let(:photo_url) { 'https://www.truffaut.com/jardin/plantes-interieur/plantes-vertes-interieur/PublishingImages/dossiers-conseils/dc-sarracenias-plante-carnivore/sarracenias-b.jpg' }

  let(:params) do
    {
      plant: {
        name:          'Rox',
        age_in_months: 3,
        size:          'medium',
        room:          'office',
        photo_url:     photo_url
      }
    }
  end

  it 'creates a plant' do
    post '/api/garden/plants/', headers: auth_headers(user), params: params

    expect(response.status).to eq(201)

    json_response = JSON.parse(response.body)
    expect(json_response).to have_key('plant')

    plant = json_response['plant']
    expect(plant['id']).not_to        be_nil
    expect(plant['name']).to          eq('Rox')
    expect(plant['photo_url']).to     eq('https://www.truffaut.com/jardin/plantes-interieur/plantes-vertes-interieur/PublishingImages/dossiers-conseils/dc-sarracenias-plante-carnivore/sarracenias-b.jpg')
    expect(plant['user_id']).to       eq(user.id)
    expect(plant['age_in_months']).to eq(3)
    expect(plant['size']).to          eq('medium')
    expect(plant['room']).to          eq('office')
  end

  context 'when user has an incorrect token' do
    let(:headers) do
      accept_header.merge('Authorization' => nil)
    end

    it 'creates a plant for the user' do
      post '/api/garden/plants/', headers: headers, params: params

      expect(response.status).to eq(401)
    end
  end
end
