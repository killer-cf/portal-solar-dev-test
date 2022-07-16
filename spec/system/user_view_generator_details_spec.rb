require 'rails_helper'

describe 'User view generator details' do
  it 'from home screen' do
    
  end
  
  it 'and sees freight value' do
    generator = PowerGenerator.create!(
      name: 'TRINA LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 16347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )
    Freight.create!(state: 'PE', weight_min: 1, weight_max: 300, cost: 150.0)

    visit root_path
    click_on 'TRINA LAJE PLUS'
    fill_in 'cep', with: '50720570'
    find('#freight_value').click_on 'Buscar'
    

    expect(page).to have_content 'TRINA LAJE PLUS'
    expect(page).to have_content 'Frete: R$150.00'
  end
end