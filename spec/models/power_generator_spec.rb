require 'rails_helper'

RSpec.describe PowerGenerator, type: :model do
  describe '#valid?' do
    it 'must be cubed_weight' do
      generator = PowerGenerator.new
      generator.valid?
      expect(generator.errors.include? :cubed_weight).to eq true
    end

    it 'set_cubed_weight' do
      generator = PowerGenerator.create!(
        name: 'POPO LAJE PLUS', 
        description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                      Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                      Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
        image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
        manufacturer: 'Trina Solar', price: 56347.00, kwp: 4.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
      )

      expect(generator.cubed_weight).to eq 93.96
    end
  end
end