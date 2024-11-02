FactoryBot.define do
  factory :animal do
    name {Faker::Name.name}
    species {Faker::Creature::Animal.name}

    hunger {0}
    hunger_modifier {1.00}

    thirst {0}
    thirst_modifier {1.00}

    mood {"contented"}
  end
end