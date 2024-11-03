require 'rails_helper'

describe Animal do
  let(:animal) { FactoryBot.create(:animal) }

  context "constants" do
    it "MOODS" do
      expect(described_class.const_defined?(:MOODS)).to eq(true)
      expect(described_class::MOODS.is_a?(Array)).to eq(true)
    end

    it "MAX_HUNGER" do
      expect(described_class.const_defined?(:MAX_HUNGER)).to eq(true)
      expect(described_class::MAX_HUNGER.is_a?(Integer)).to eq(true)
    end

    it "MAX_THIRST" do
      expect(described_class.const_defined?(:MAX_THIRST)).to eq(true)
      expect(described_class::MAX_THIRST.is_a?(Integer)).to eq(true)
    end
  end

  context "mood" do
    it "assigns dynamic boolean methods to mood" do
      Animal::MOODS.each do |ref_mood|
        expect(animal.respond_to?("#{ref_mood}?")).to eq(true)
      end
    end
  end

end