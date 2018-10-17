class Api::V1::Prescriptions::PrescriptionController < ApplicationController

  def index
    render json: Prescription.all, status: 202
  end

  def show
    if Prescription.exists?(params[:id])
      render json: Prescription.find(params[:id]), status: 202
    else
      render json: {error: "Prescription does not exist"}, status: 404
    end
  end
end
