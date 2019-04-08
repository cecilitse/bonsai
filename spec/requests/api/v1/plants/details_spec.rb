require 'rails_helper'

RSpec.describe 'Plant details', type: :request do
  let(:user) { create(:user, nickname: 'Capucine') }

  let!(:plant) do
    Plant.create!(
      user: user,
      name: 'Gabin',
      age_in_months: 10,
      size: :tall,
      room: 'living-room',
      photo_url: 'http://www.delightfull.eu/inspirations//wp-content/uploads/2016/11/10-happy-living-room-ideas-with-plants-2.jpg'
    )
  end

  it 'gets plant details' do
    get "/api/plants/#{plant.id}", headers: { 'Accept' => 'application/json;version=1' }

    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body)
    json_plant    = json_response['plant']

    expect(json_response).to have_key('plant')

    expect(json_plant['id']).to            eq(plant.id)
    expect(json_plant['name']).to          eq('Gabin')
    expect(json_plant['photo_url']).to     eq('http://www.delightfull.eu/inspirations//wp-content/uploads/2016/11/10-happy-living-room-ideas-with-plants-2.jpg')
    expect(json_plant['user_id']).to       eq(user.id)
    expect(json_plant['age_in_months']).to eq(10)
    expect(json_plant['size']).to          eq('tall')
    expect(json_plant['room']).to          eq('living-room')
  end
end
