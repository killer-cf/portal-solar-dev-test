class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.page(params[:page]).per(6)
  end

  def search
    @power_generators = PowerGenerator.where("name LIKE ?", "%#{params[:query].upcase}%").page(params[:page]).per(6)
  end

  def filter_price
    @power_generators = PowerGenerator.order(:price, :name).page(params[:page]).per(6)
  end

  def filter_kwp
    @power_generators = PowerGenerator.order(:kwp, :name).page(params[:page]).per(6)
  end
end
