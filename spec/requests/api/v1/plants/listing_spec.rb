require 'rails_helper'

RSpec.describe 'Plants listing', version: 1, type: :request do
  let(:cecile)  { create(:user, nickname: 'Cecile') }
  let(:nicolas) { create(:user, nickname: 'Nicolas') }

  let!(:plants) do
    [
      Plant.create!(
        user: nicolas,
        name: 'Hairy',
        age_in_months: 6,
        size: :tall,
        room: 'bedroom',
        photo_url: "https://images.pexels.com/photos/260046/pexels-photo-260046.jpeg",
      ),
      Plant.create!(
        user: cecile,
        name: 'Albert',
        age_in_months: 3,
        size: :medium,
        room: 'living-room',
        photo_url: "https://www.melyssagriffin.com/wp-content/uploads/2014/10/plants-home-decor-9.jpg",
      )
    ]
  end

  it 'lists all plants' do
    get '/api/plants', headers: accept_header
    json_plants = JSON.parse(response.body)

    expect(response.status).to             eq(200)
    expect(json_plants['plants'].count).to eq(2)

    # --- PLANT 1 (order by last created one)
    plant = json_plants['plants'].first

    expect(plant['id']).to            eq(plants.second.id)
    expect(plant['name']).to          eq('Albert')
    expect(plant['photo_url']).to     eq('https://www.melyssagriffin.com/wp-content/uploads/2014/10/plants-home-decor-9.jpg')
    expect(plant['user_id']).to       eq(cecile.id)
    expect(plant['age_in_months']).to eq(3)
    expect(plant['size']).to          eq('medium')
    expect(plant['room']).to          eq('living-room')

    # -- PLANT 2
    plant = json_plants['plants'].second

    expect(plant['id']).to            eq(plants.first.id)
    expect(plant['name']).to          eq('Hairy')
    expect(plant['photo_url']).to     eq('https://images.pexels.com/photos/260046/pexels-photo-260046.jpeg')
    expect(plant['user_id']).to       eq(nicolas.id)
    expect(plant['age_in_months']).to eq(6)
    expect(plant['size']).to          eq('tall')
    expect(plant['room']).to          eq('bedroom')
  end
end
