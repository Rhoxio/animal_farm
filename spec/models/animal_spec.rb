require 'rails_helper'

describe Animal do
  let(:animal) { FactoryBot.create(:animal) }

  context "constants" do
    it "MOODS" do
      expect(described_class.const_defined?(:MOODS)).to eq(true)
      expect(described_class::MOODS.is_a?(Array)).to eq(true)
    end

    it "MAX_CONSUMPTION_THRESHOLD" do
      expect(described_class.const_defined?(:MAX_CONSUMPTION_THRESHOLD)).to eq(true)
      expect(described_class::MAX_CONSUMPTION_THRESHOLD.is_a?(Integer)).to eq(true)
    end
  end

  context "mood" do
    it "assigns dynamic boolean methods to mood" do
      Animal::MOODS.each do |ref_mood|
        expect(animal.respond_to?("#{ref_mood}?")).to eq(true)
      end
    end
  end

  context "utility methods" do
    let(:mouse){ FactoryBot.create(:mouse) }
    let(:elephant){ FactoryBot.create(:elephant) }

    context "maximum_*" do
      it "acquires an accurate method" do
        described_class::CONSUMPTION_ATTRIBUES.each do |attr|
          expect(mouse.public_send("maximum_#{attr}")).to eq(10.0)
          expect(elephant.public_send("maximum_#{attr}")).to eq(1000.0)
        end
      end
    end

    context "hunger_threshold" do
      it "correctly calcs" do
        expect(mouse.hunger_threshold).to eq(1.0)
        expect(elephant.hunger_threshold).to eq(100.0)
      end
    end

    context "thirst_threshold" do
      it "correctly calcs" do
        expect(mouse.thirst_threshold).to eq(2.0)
        expect(elephant.thirst_threshold).to eq(200.0)
      end
    end

    context "hungry?" do
      it "accurately checks relative hunger levels" do
        mouse.update!(hunger: mouse.hunger_threshold - 1)
        expect(mouse.hungry?).to eq(true)

        mouse.update!(hunger: mouse.hunger_threshold)
        expect(mouse.hungry?).to eq(true)

        mouse.update!(hunger: mouse.hunger_threshold + 1)
        expect(mouse.hungry?).to eq(false)
      end
    end

    context "thirsty?" do
      it "accurately checks relative thirst levels" do
        mouse.update!(thirst: mouse.thirst_threshold - 1)
        expect(mouse.thirsty?).to eq(true)

        mouse.update!(thirst: mouse.thirst_threshold)
        expect(mouse.thirsty?).to eq(true)

        mouse.update!(thirst: mouse.thirst_threshold + 2)
        expect(mouse.thirsty?).to eq(false)
      end
    end
  end

end