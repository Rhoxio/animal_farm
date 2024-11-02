class Animal < ApplicationRecord
  # 100 works as our standard meter for consumption mechanics
  MAX_CONSUMPTION_THRESHOLD = 100
  HUNGER_BREAKPOINT = 10
  THIRST_BREAKPOINT = 5

  CONSUMPTION_ATTRIBUES = [:hunger, :thirst].freeze
  MOODS = %w{ happy sad angry hungry thirsty contented }.freeze

  CONSUMPTION_ATTRIBUES.each do |consumption_attribute|
    # maximum_hunger, for example
    define_method "maximum_#{consumption_attribute}" do
      MAX_CONSUMPTION_THRESHOLD * self.public_send("#{consumption_attribute}_modifier")
    end
  end

  MOODS.each do |ref_mood|
    define_method("#{ref_mood}?") {mood == ref_mood}
  end

  def hunger_threshold
    maximum_hunger / HUNGER_BREAKPOINT
  end

  def thirst_threshold
    # Animals are thisty more often than hungry and are more sentitive to thirst
    maximum_thirst / THIRST_BREAKPOINT
  end

  # Without reasonable convention, we keep these methods static.
  def hungry?
    hunger <= hunger_threshold
  end

  def thirsty?
    thirst <= thirst_threshold
  end

end
