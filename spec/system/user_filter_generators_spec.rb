require 'rails_helper'

describe 'user filters generators' do
  it 'per price' do
    item_second_page = PowerGenerator.create!(
      name: 'LAJE PLUS HUHU', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 108347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'POLI HALF CELL PRIMO', 
      description: 'Eficiência média da célula de 17% PID Free Garantia de 10 anos para o produto 
                    e Garantia linear de 25 anos Sistemas comerciais ou residenciais on-grid e off-grid', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/106221/large/20190806-1-1pmgplo.?1565112360', 
      manufacturer: 'BYD', price: 25565.70, kwp: 5.36, height: 0.8, width: 0.25, lenght: 2.2, weight: 118, structure_type: :trapezoidal
    )

    PowerGenerator.create!(
      name: 'TRINA LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 46347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'MAMA LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 93347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'POPO LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 56347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'FEFE LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 18347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    first = PowerGenerator.create!(
      name: 'JOJO LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 16347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    visit root_path
    click_on 'Preço'

    expect(page).to have_content first.name
    expect(page).not_to have_content item_second_page.name
  end

  it 'per kwp' do
    item_second_page = PowerGenerator.create!(
      name: 'LAJE PLUS HUHU', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 108347.00, kwp: 10.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'POLI HALF CELL PRIMO', 
      description: 'Eficiência média da célula de 17% PID Free Garantia de 10 anos para o produto 
                    e Garantia linear de 25 anos Sistemas comerciais ou residenciais on-grid e off-grid', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/106221/large/20190806-1-1pmgplo.?1565112360', 
      manufacturer: 'BYD', price: 25565.70, kwp: 5.36, height: 9.8, width: 0.25, lenght: 2.2, weight: 118, structure_type: :trapezoidal
    )

    PowerGenerator.create!(
      name: 'TRINA LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 46347.00, kwp: 7.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'MAMA LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 93347.00, kwp: 5.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'POPO LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 56347.00, kwp: 4.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    PowerGenerator.create!(
      name: 'FEFE LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 18347.00, kwp: 3.21, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    first = PowerGenerator.create!(
      name: 'JOJO LAJE PLUS', 
      description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                    Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                    Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
      manufacturer: 'Trina Solar', price: 16347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
    )

    visit root_path
    click_on 'KWP'

    expect(page).to have_content first.name
    expect(page).not_to have_content item_second_page.name
  end
end