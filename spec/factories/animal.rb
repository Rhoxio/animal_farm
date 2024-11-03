FactoryBot.define do
  factory :animal do
    name {Faker::Name.name}
    species {Faker::Creature::Animal.name}

    hunger {0}
    hunger_modifier {1.00}

    thirst {0}
    thirst_modifier {1.00}

    mood {"hungry"}
  end

  factory :elephant, class: Animal do
    name {"Dumbo"}
    species {"elephant"}

    hunger {0}
    hunger_modifier {10.00}

    thirst {0}
    thirst_modifier {10.00}

    mood {"hungry"}
  end

  factory :mouse, class: Animal do
    name {"Sparkles"}
    species {'mouse'}

    hunger {0}
    hunger_modifier {0.10}

    thirst {0}
    thirst_modifier {0.10}

    mood {"hungry"}
  end
end