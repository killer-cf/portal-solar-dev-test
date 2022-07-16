class PowerGenerator < ApplicationRecord
  validates :name, :description, :image_url, :manufacturer, :price, :kwp, :cubed_weight, presence: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 40 }
  validates :width, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :lenght, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000 }

  enum structure_type: %i[
    metalico
    ceramico
    fibrocimento
    laje
    solo
    trapezoidal
  ]

  before_validation :set_cubed_weight

  def set_cubed_weight
    return unless height
    self.cubed_weight = height * width * lenght * 300
  end

  def get_freight(state = '')
    return if state.nil?
    cubed_weight = height * width * lenght * 300
    freight = Freight.find_by('state = ? AND weight_min <= ? AND weight_max >= ?', state, cubed_weight, cubed_weight)
    freight.cost
  end
end
