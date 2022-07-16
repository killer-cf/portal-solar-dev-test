require 'rails_helper'

describe 'User uses search recommendations' do
  it 'success' do
    PowerGenerator.create!(
      name: 'CELLS MONO PERC', 
      description: 'Potência no ponto máximo de potência - 365W 
                    Corrente de Curto Circuito - 9,75A
                    Tensão em Circuito Aberto - 48,16V
                    Corrente no ponto máximo de potência - 9,27A
                    Tensão no ponto máximo de potência - 39,38V
                    Eficiência =18,8%
                    Tolerância de potências +5W
                    Desempenho mínimo sob condições de teste padrão STC (1000 W/m², 25 °C, espectro AM 1,5 G)', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/13500/large/20190103-225-1sblgyr.?1546504464', 
      manufacturer: 'Q CELLS', 
      price: 13000.35,
      kwp: 2.68,
      height: 0.6,
      width: 0.35,
      lenght: 1.9,
      weight: 150,
      structure_type: :trapezoidal
    )

    PowerGenerator.create!(
      name: 'WEG HÍBRIDO', 
      description: 'Fácil instalação por apenas uma pessoa com peso de 10,6 kg    
                    Conector CA otimizado para rápida ligação    
                    Configuração rápida do inversor via APP
                    Interface de armazenamento de energia Plug & Play integrada    
                    Dotado de seccionamento CC', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/13053/large/20181221-225-p6rv7w.?1545398330', 
      manufacturer: 'WEG', 
      price: 12582.30,
      kwp: 3.06,
      height: 0.7,
      width: 0.4,
      lenght: 1.5,
      weight: 268,
      structure_type: :fibrocimento
    )

    PowerGenerator.create!(
      name: 'FRONIUS METALICA', 
      description: 'Potência nominal máx. (Pmáx) 335W
                    Tensão operacional ideal (Vmp) 38,10V
                    Corrente operacional ideal (Imp) 8,79A 
                    Tensão de circuito aberto (Voc) 45,44 V
                    Corrente de curto circuito 9,25A 
                    Eficiência do módulo 17% 
                    Temperatura operacional -40 °C ~ +85°C
                    Tensão máxima do sistema 1.500V 
                    Classificação máxima de fusíveis da série 15 A', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/105434/large/20190806-1-1dlw3m7.?1565111320', 
      manufacturer: 'WEG', 
      price: 86176.70,
      kwp: 30.15,
      height: 1.7,
      width: 0.2,
      lenght: 2.2,
      weight: 155,
      structure_type: :metalico
    )

    PowerGenerator.create!(
      name: 'TRIFÁSICO 380V', 
      description: '3 MPPTs para adaptação versáteis a diferentes tipos ou quantidades de módulos construídos com diferentes alinhamentos    
                    Monitoramento inteligente de 6 strings e 80% de economia de tempo na detecção de falhas    
                    Portas RS485 e USB para conectividade e gerenciamento de dados    
                    Display LCD gráfico local e monitoramento remoto', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/13384/large/Kit-Gerador-de-Energia-Solar-WEG---SIW500H---ST013-18-22.jpg?1546436139', 
      manufacturer: 'WEG', 
      price: 52990.00,
      kwp: 23.14,
      height: 2,
      width: 0.15,
      lenght: 1.8,
      weight: 218,
      structure_type: :metalico
    )

    visit root_path
    fill_in 'kwp_min', with: '23'
    select 'WEG', from: 'manufacturer'
    fill_in 'price_max', with: '90000'
    select 'metalico', from: 'structure_type'
    find('.advanced-form').click_on 'Buscar'

    expect(page).to have_content 'TRIFÁSICO 380V'
    expect(page).to have_content 'FRONIUS METALICA'
    expect(page).not_to have_content 'CELLS MONO PERC'
    expect(page).not_to have_content 'WEG HÍBRIDO'
  end

  it 'with blank fields' do
    PowerGenerator.create!(
      name: 'CELLS MONO PERC', 
      description: 'Potência no ponto máximo de potência - 365W 
                    Corrente de Curto Circuito - 9,75A
                    Tensão em Circuito Aberto - 48,16V
                    Corrente no ponto máximo de potência - 9,27A
                    Tensão no ponto máximo de potência - 39,38V
                    Eficiência =18,8%
                    Tolerância de potências +5W
                    Desempenho mínimo sob condições de teste padrão STC (1000 W/m², 25 °C, espectro AM 1,5 G)', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/13500/large/20190103-225-1sblgyr.?1546504464', 
      manufacturer: 'Q CELLS', 
      price: 13000.35,
      kwp: 2.68,
      height: 0.6,
      width: 0.35,
      lenght: 1.9,
      weight: 150,
      structure_type: :trapezoidal
    )

    PowerGenerator.create!(
      name: 'WEG HÍBRIDO', 
      description: 'Fácil instalação por apenas uma pessoa com peso de 10,6 kg    
                    Conector CA otimizado para rápida ligação    
                    Configuração rápida do inversor via APP
                    Interface de armazenamento de energia Plug & Play integrada    
                    Dotado de seccionamento CC', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/13053/large/20181221-225-p6rv7w.?1545398330', 
      manufacturer: 'WEG', 
      price: 12582.30,
      kwp: 3.06,
      height: 0.7,
      width: 0.4,
      lenght: 1.5,
      weight: 268,
      structure_type: :fibrocimento
    )

    PowerGenerator.create!(
      name: 'FRONIUS METALICA', 
      description: 'Potência nominal máx. (Pmáx) 335W
                    Tensão operacional ideal (Vmp) 38,10V
                    Corrente operacional ideal (Imp) 8,79A 
                    Tensão de circuito aberto (Voc) 45,44 V
                    Corrente de curto circuito 9,25A 
                    Eficiência do módulo 17% 
                    Temperatura operacional -40 °C ~ +85°C
                    Tensão máxima do sistema 1.500V 
                    Classificação máxima de fusíveis da série 15 A', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/105434/large/20190806-1-1dlw3m7.?1565111320', 
      manufacturer: 'WEG', 
      price: 86176.70,
      kwp: 30.15,
      height: 1.7,
      width: 0.2,
      lenght: 2.2,
      weight: 155,
      structure_type: :metalico
    )

    PowerGenerator.create!(
      name: 'TRIFÁSICO 380V', 
      description: '3 MPPTs para adaptação versáteis a diferentes tipos ou quantidades de módulos construídos com diferentes alinhamentos    
                    Monitoramento inteligente de 6 strings e 80% de economia de tempo na detecção de falhas    
                    Portas RS485 e USB para conectividade e gerenciamento de dados    
                    Display LCD gráfico local e monitoramento remoto', 
      image_url: 'https://marketplace-img-production.s3.amazonaws.com/products/13384/large/Kit-Gerador-de-Energia-Solar-WEG---SIW500H---ST013-18-22.jpg?1546436139', 
      manufacturer: 'WEG', 
      price: 52990.00,
      kwp: 23.14,
      height: 2,
      width: 0.15,
      lenght: 1.8,
      weight: 218,
      structure_type: :metalico
    )

    visit root_path
    fill_in 'kwp_min', with: ''
    fill_in 'price_max', with: ''
    select 'metalico', from: 'structure_type'
    select 'WEG', from: 'manufacturer'
    find('.advanced-form').click_on 'Buscar'

    expect(page).to have_content 'TRIFÁSICO 380V'
    expect(page).to have_content 'FRONIUS METALICA'
    expect(page).not_to have_content 'CELLS MONO PERC'
    expect(page).not_to have_content 'WEG HÍBRIDO'

  end
end