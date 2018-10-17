class Api::V1::Prescribers::PrescriberController < ApplicationController

  def index
    render json: Prescriber.all, status: 202
  end

  def show
    if Prescriber.exists?(params[:id])
      render json: Prescriber.find(params[:id]), status: 202
    else
      render json: {error: "Prescriber does not exist"}, status: 404
    end
  end
end
