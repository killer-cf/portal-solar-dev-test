require 'rails_helper'

describe 'Generators API ' do
  context 'GET /api/v1/power_generators' do
    it 'success' do
      PowerGenerator.create!(
        name: 'POLI HALF CELL PRIMO', 
        description: 'Eficiência média da célula de 17% PID Free Garantia de 10 anos para o produto 
                      e Garantia linear de 25 anos Sistemas comerciais ou residenciais on-grid e off-grid', 
        image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/106221/large/20190806-1-1pmgplo.?1565112360', 
        manufacturer: 'BYD', price: 20565.70, kwp: 5.36, height: 0.8, width: 0.25, lenght: 2.2, weight: 118, structure_type: :trapezoidal
      )
      
      PowerGenerator.create!(
        name: 'TRINA LAJE PLUS', 
        description: 'Eficiência média da célula de 19,7% 144 meia células fotovoltaicas monocristalinas
                      Baixos coeficientes térmicos para maior produção de energia em alta temperatura de operação
                      Garantia de 10 anos para o produto e Garantia linear de 25 anos ', 
        image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/28805/large/20190703-1-19o5xbt.?1562197086', 
        manufacturer: 'Trina Solar', price: 16347.00, kwp: 3.20, height: 0.58, width: 0.3, lenght: 1.8, weight: 99, structure_type: :laje
      )

      get '/api/v1/power_generators'

      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
      expect(json_response.first['name']).to eq 'POLI HALF CELL PRIMO'
      expect(json_response.last['name']).to eq 'TRINA LAJE PLUS'
    end

    it 'return empty if there is no power_generators' do
      get '/api/v1/power_generators'

      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 0
    end
  end
end