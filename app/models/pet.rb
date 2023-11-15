class Pet < ApplicationRecord
  SPECIES = %w[dog cat rabbit snake turtle].freeze
  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }

  def found_days_ago
    return unless found_on # evita que o método quebre se o found_on for nil

    (Date.today - found_on).to_i
  end
end
