require 'rails_helper'

describe Animal do
  it "sandboxes" do
    animal = FactoryBot.create(:animal)
    p animal
  end
end