FactoryBot.define do
  factory :animal do
    name {Faker::Name.name}
    species {Faker::Creature::Animal.name}

    hunger {0}
    thirst {0}
    mood {"contented"}
  end
end