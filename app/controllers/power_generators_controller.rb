class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.page(params[:page]).per(6)
  end

  def search
    @power_generators = PowerGenerator.where("name LIKE ?", "%#{params[:query].upcase}%").page(params[:page]).per(6)

    render :index
  end

  def advanced_search
    params[:kwp_min].empty? && params[:kwp_min] = 0
    params[:price_max].empty? && params[:price_max] = 1000000

    @power_generators = PowerGenerator.where('kwp >= ? AND price <= ? AND manufacturer = ?',
                                              params[:kwp_min], params[:price_max], params[:manufacturer])
                                             .where(structure_type: PowerGenerator.structure_types["#{params[:structure_type]}"])
                                             .page(params[:page]).per(6)
  
    render :index
  end

  def filter_price
    @power_generators = PowerGenerator.order(:price, :name).page(params[:page]).per(6)

    render :index
  end

  def filter_kwp
    @power_generators = PowerGenerator.order(:kwp, :name).page(params[:page]).per(6)

    render :index
  end

  def freight_value
    response = Faraday.get('https://viacep.com.br/ws/50720570/json/')
    response_hash = JSON.parse(response.body)
    @state = response_hash["uf"]
    @power_generators = PowerGenerator.page(params[:page]).per(6)
    render :index
  end
end
