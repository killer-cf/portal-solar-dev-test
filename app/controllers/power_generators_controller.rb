class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def search
    @power_generators = PowerGenerator.where("name LIKE ?", "%#{params[:query].upcase}%")
  end
end
