class Animal < ApplicationRecord
  MAX_HUNGER = 100
  MAX_THIRST = 100

  MOODS = %w{ happy sad angry hungry thirsty contented }

  def hungry?
    hunger < 10
  end

  def thirsty?
    thirst < 10
  end

  MOODS.each do |ref_mood|
    define_method("#{ref_mood}?") {mood == ref_mood}
  end

end
