class Api::V1::Diseases::DiseaseController < ApplicationController

  def index
    render json: Disease.all, status: 202, each_serializer: DiseaseSerializer
  end

  def show
    if Disease.exists?(params[:id])
      render json: Disease.find(params[:id]), status: 202, serializer: DiseaseSerializer
    else
      render json: {error: "Disease could not be found by that id"}, status: 404
    end
  end
end
