class Food < ApplicationRecord
  UTILIZATION_TOP_END = 100
  UTILIZATION_BOTTOM_END = 0
  UTILIZATION_ATTRIBUTES = [:calories, :hydration]

  validates :utilization, numericality: { greater_than_or_equal_to: UTILIZATION_BOTTOM_END,
                                          less_than_or_equal_to: UTILIZATION_TOP_END }

  UTILIZATION_ATTRIBUTES.each do |reference|
    define_method("remaining_#{reference}") do
      (self.public_send(reference) * utilization_remaining).round.to_i
    end
  end

  def utilization_remaining
    # Not rounding here since we want the consuming contexts to define how they want to use the rounding
    # instead of enforcing it context-wide.
    difference = UTILIZATION_TOP_END - utilization
    (difference.to_f / 100)
  end

  def fully_utilized?
    utilization == UTILIZATION_TOP_END
  end

  def not_utilized?
    utilization == UTILIZATION_BOTTOM_END
  end

end
