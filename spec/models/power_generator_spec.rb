require 'rails_helper'

RSpec.describe PowerGenerator, type: :model do
  describe '#valid?' do
    it 'must be cubed_weight' do
      generator = PowerGenerator.new
      generator.valid?
      expect(generator.errors.include? :cubed_weight).to eq true
    end

    it 'set_cubed_weight' do
      generator = PowerGenerator.new(height: 1, width: 0.35, lenght: 2)
      expect(generator.set_cubed_weight).to eq 210.0
    end
  end
end
