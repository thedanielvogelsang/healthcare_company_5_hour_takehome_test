class Api::V1::Medications::MedicationController < ApplicationController

  def index
    render json: Medication.all, status: 202
  end

  def show
    if Medication.exists?(params[:id])
      render json: Medication.find(params[:id]), status: 202
    else
      render json: {error: "Medication does not exist"}, status: 404
    end
  end
end
