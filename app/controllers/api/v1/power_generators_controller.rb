class Api::V1::PowerGeneratorsController < ActionController::API
  def index
    power_generators = PowerGenerator.all

    render status: 200, json: power_generators
  end
end