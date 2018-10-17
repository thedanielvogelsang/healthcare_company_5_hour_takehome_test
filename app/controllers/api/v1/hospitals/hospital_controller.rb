class Api::V1::Hospitals::HospitalController < ApplicationController

  def index
    render json: Hospital.all, status: 202, each_serializer: HospitalSerializer
  end

  def show
    if Hospital.exists?(params[:id])
      render json: Hospital.find(params[:id]), status: 202, serializer: HospitalSerializer
    else
      render json: {error: "Hospital does not exist"}, status: 404
    end
  end
end
