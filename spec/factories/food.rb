FactoryBot.define do
  factory :food do
    name {"apple"}
    calories {100}
    hydration {20}
    flavor {"sweet"}
  end

  factory :cup_of_water, class: Food do
    name {"cup of water"}
    calories {0}
    hydration {100}
    flavor {nil}
  end
end