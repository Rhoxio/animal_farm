require 'rails_helper'

describe Food do
  let(:food) { FactoryBot.create(:food) }

  it { should validate_numericality_of(:utilization)
                .is_greater_than_or_equal_to(0)
                .is_less_than_or_equal_to(100) }

  context "utility_methods" do

    it "fully_utilized?" do
      food.update!(utilization: 0)
      expect(food.fully_utilized?).to eq(false)
      food.update!(utilization: 100)
      expect(food.fully_utilized?).to eq(true)
    end

    it "not_utilized?" do
      food.update!(utilization: 100)
      expect(food.not_utilized?).to eq(false)
      food.update!(utilization: 0)
      expect(food.not_utilized?).to eq(true)
    end

    context "remaining_calories" do
      it "will calc base correctly" do
        expect(food.remaining_calories).to eq(100)
      end

      context "with differences" do
        it "will calc partial utilization correctly" do
          food.update!(utilization: 10)
          expect(food.remaining_calories).to eq(90)
        end

        it "will calc full utilization correctly" do
          food.update!(utilization: 100)
          expect(food.remaining_calories).to eq(0)
        end
      end
    end

    context "remaining_hydration" do
      it "will calc base utilization correctly" do
        expect(food.remaining_hydration).to eq(20)
      end

      context "with differences" do
        it "will calc partial utilization correctly" do
          food.update!(utilization: 10)
          expect(food.remaining_hydration).to eq(18)
        end

        it "will calc full utilization correctly" do
          food.update!(utilization: 100)
          expect(food.remaining_hydration).to eq(0)
        end

        it "will calc rounding correctly" do
          # Based on 20
          food.update!(utilization: 15)
          expect(food.remaining_hydration).to eq(17)

          food.update!(utilization: 21)
          expect(food.remaining_hydration).to eq(16)

          food.update!(utilization: 39)
          expect(food.remaining_hydration).to eq(12)
        end
      end
    end

  end
end
