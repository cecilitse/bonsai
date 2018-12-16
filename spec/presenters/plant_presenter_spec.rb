require 'rails_helper'

describe PlantPresenter, type: 'presenter' do
  subject(:presenter) { PlantPresenter.new(plant) }

  let(:plant) { Plant.new(name: 'Alfred') }

  describe '#care_moments_needed' do
    let(:user) { build(:user) }

    context 'when plant has no care moment at all' do
      let(:plant) do
        plant = create(:plant, user: user)
        PlantQuery.relation.include_care_status.find(plant.id)
      end

      it 'returns all care moments' do
        expect(presenter.care_moments_needed).to match_array([:water, :weed, :repot])
      end
    end

    context 'when plant does not need weed care moment' do
      let(:plant) do
        plant = create(:plant, user: user)
        plant.care_moments.create!(code: 'weed', points: 2, date: Date.today)

        PlantQuery.relation.include_care_status.find(plant.id)
      end

      it 'returns all care moments except weed' do
        expect(presenter.care_moments_needed).to match_array([:water, :repot])
      end
    end

    context 'when has not included its care status' do
      it 'raises an error' do
        expect { presenter.care_moments_needed }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#human_size' do
    it "returns 'quite small' when plant is small" do
      plant.size = 'small'
      expect(presenter.human_size).to eq('quite small')
    end

    it "returns 'almost tall' when plant is medium" do
      plant.size = 'medium'
      expect(presenter.human_size).to eq('almost tall')
    end

    it "returns 'so tall' when plant is tall" do
      plant.size = 'tall'
      expect(presenter.human_size).to eq('so tall')
    end
  end
end
